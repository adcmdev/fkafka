part of 'package:flutter_kafka/flutter_kafka.dart';

class TopicData {
  final KafkaAction action;
  final Map<String, dynamic> data;

  const TopicData({
    this.action = KafkaAction.created,
    this.data = const {},
  });
}

enum KafkaAction {
  created,
  edited,
  deleted,
  changed,
}
