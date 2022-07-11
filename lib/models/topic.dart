part of 'package:fkafka/fkafka.dart';

class TopicData {
  final String topic;
  final FkafkaAction action;
  final Map<String, dynamic> data;

  const TopicData({
    this.topic = '',
    this.action = FkafkaAction.created,
    this.data = const {},
  });

  TopicData copyWith({
    String? topic,
    FkafkaAction? action,
    Map<String, dynamic>? data,
  }) {
    return TopicData(
      topic: topic ?? this.topic,
      action: action ?? this.action,
      data: data ?? this.data,
    );
  }
}

enum FkafkaAction {
  created,
  edited,
  deleted,
  changed,
}
