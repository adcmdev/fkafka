library flutter_kafka;

import 'package:uuid/uuid.dart';

part 'package:flutter_kafka/models/subscriber.dart';
part 'package:flutter_kafka/models/producer.dart';
part 'package:flutter_kafka/models/topic.dart';

typedef OnTopicCallBack = void Function(TopicData topic);

class Kafka {
  static List<KafkaSubscriber> _listeners = [];
  final _uuid = const Uuid().v1();

  /// Emit [topic] to all listeners
  void emit(String topic, [TopicData topicData = const TopicData()]) {
    _listeners.where((k) => k.topic == topic).forEach((k) {
      k.onTopic(topicData);
    });
  }

  /// Listen come [topic]
  void on(String topic, OnTopicCallBack onTopic) {
    _listeners.add(
      KafkaSubscriber(
        uuid: _uuid,
        topic: topic,
        onTopic: onTopic,
      ),
    );
  }

  /// Unsubscribe from topic [topic] listener
  void unSubcribe() {
    _listeners = _listeners.where((k) => k.uuid != _uuid).toList();
  }
}
