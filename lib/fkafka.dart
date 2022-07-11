library fkafka;

import 'package:uuid/uuid.dart';

part 'package:fkafka/models/subscriber.dart';
part 'package:fkafka/models/producer.dart';
part 'package:fkafka/models/topic.dart';

typedef OnTopicCallBack = void Function(TopicData topic);

class Fkafka {
  static final List<KafkaSubscriber> _listeners = [];
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
        KafkaSubscriber(
          uuid: _uuid,
          topic: topic,
          onTopic: onTopic,
        ),
      );
    } catch (_) {}
  }

  /// Unsubscribe from topic [topic] listener
  void unSubcribe() {
    if (index == -1) return;

    try {
      _listeners[index] = _listeners[index].copyWith(active: false);
    } catch (_) {}
  }

  /// ReSubscribe from topic [topic] listener
  void reSubcribe() {
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
