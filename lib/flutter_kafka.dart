library flutter_kafka;

import 'package:uuid/uuid.dart';

part 'package:flutter_kafka/models/subscriber.dart';
part 'package:flutter_kafka/models/producer.dart';
part 'package:flutter_kafka/models/topic.dart';

typedef OnTopicCallBack = void Function(TopicData topic);

class Kafka {
  static final List<KafkaSubscriber> _listeners = [];
  final _uuid = const Uuid().v1();

  /// Emit [topic] to all listeners
  void emit(String topic, [TopicData topicData = const TopicData()]) {
    _listeners.where((k) => k.topic == topic && k.active).forEach((k) {
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
    if (index == -1) return;

    _listeners[index] = _listeners[index].copyWith(
      active: false,
    );
  }

  /// ReSubscribe from topic [topic] listener
  void reSubcribe() {
    if (index == -1) return;

    _listeners[index] = _listeners[index].copyWith(
      active: true,
    );
  }

  bool get listening {
    if (index == -1) return false;

    return _listeners[index].active;
  }

  int get index => _listeners.indexWhere((k) => k.uuid == _uuid);
}
