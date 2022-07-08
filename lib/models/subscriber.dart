part of 'package:flutter_kafka/flutter_kafka.dart';

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
