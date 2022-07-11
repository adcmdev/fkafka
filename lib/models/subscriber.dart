part of 'package:fkafka/fkafka.dart';

class KafkaSubscriber {
  final String uuid;
  final String topic;
  final OnTopicCallBack onTopic;
  final bool active;

  const KafkaSubscriber({
    required this.uuid,
    required this.topic,
    required this.onTopic,
    this.active = true,
  });

  KafkaSubscriber copyWith({
    String? uuid,
    String? topic,
    OnTopicCallBack? onTopic,
    bool? active,
  }) {
    return KafkaSubscriber(
      uuid: uuid ?? this.uuid,
      topic: topic ?? this.topic,
      onTopic: onTopic ?? this.onTopic,
      active: active ?? this.active,
    );
  }
}
