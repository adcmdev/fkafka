library flutter_kafka;

import 'package:uuid/uuid.dart';

typedef OnTopicCallBack = void Function(Map<String, dynamic> data);

class Kafka {
  static List<KafkaSubscriber> _listeners = [];
  final _uuid = const Uuid().v1();

  /// Emit [topic] to all listeners
  void emit(String topic, [Map<String, dynamic> data = const {}]) {
    _listeners.where((k) => k.topic == topic).forEach((k) {
      k.onTopic(data);
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

  /// Unsubscribe from topic [topic]
  void unSubcribe() {
    _listeners = _listeners.where((k) => k.uuid != _uuid).toList();
  }
}

class KafkaSubscriber {
  final String uuid;
  final String topic;
  final OnTopicCallBack onTopic;

  const KafkaSubscriber({
    required this.uuid,
    required this.topic,
    required this.onTopic,
  });
}
