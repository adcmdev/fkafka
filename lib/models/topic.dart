part of 'package:fkafka/fkafka.dart';

class TopicData {
  final String topic;
  final KafkaAction action;
  final Map<String, dynamic> data;

  const TopicData({
    this.topic = '',
    this.action = KafkaAction.created,
    this.data = const {},
  });

  TopicData copyWith({
    String? topic,
    KafkaAction? action,
    Map<String, dynamic>? data,
  }) {
    return TopicData(
      topic: topic ?? this.topic,
      action: action ?? this.action,
      data: data ?? this.data,
    );
  }
}

enum KafkaAction {
  created,
  edited,
  deleted,
  changed,
}
