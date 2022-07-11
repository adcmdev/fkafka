library fkafka;

import 'package:uuid/uuid.dart';

part 'package:fkafka/models/subscriber.dart';
part 'package:fkafka/models/producer.dart';
part 'package:fkafka/models/topic.dart';

typedef OnTopicCallBack = void Function(TopicData topic);

class Fkafka {
  static final List<FkafkaSubscriber> _listeners = [];
  final _uuid = const Uuid().v1();

  /// Emit [topic] to all listeners
  void emit(String topic, [TopicData topicData = const TopicData()]) {
    try {
      _listeners.where((k) => k.topic == topic && k.active).forEach((k) {
        final data = topicData.copyWith(
          topic: topic,
        );

        k.onTopic(data);
      });
    } catch (_) {}
  }

  /// Listen come [topic]
  void on(String topic, OnTopicCallBack onTopic) {
    try {
      _listeners.add(
        FkafkaSubscriber(
          uuid: _uuid,
          topic: topic,
          onTopic: onTopic,
        ),
      );
    } catch (_) {}
  }

  /// Close connection from topic [topic] listener
  void close() {
    if (index == -1) return;

    try {
      _listeners[index] = _listeners[index].copyWith(active: false);
    } catch (_) {}
  }

  /// ReOpen active connection, if connection is already closed from topic [topic] listener
  void reOpen() {
    if (index == -1) return;

    try {
      _listeners[index] = _listeners[index].copyWith(active: true);
    } catch (_) {}
  }

  bool get listening {
    if (index == -1) return false;

    return _listeners[index].active;
  }

  int get index => _listeners.indexWhere((k) => k.uuid == _uuid);
}
