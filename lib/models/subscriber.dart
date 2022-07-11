part of 'package:fkafka/fkafka.dart';

class FkafkaSubscriber {
  final String uuid;
  final String topic;
  final OnTopicCallBack onTopic;
  final bool active;

  const FkafkaSubscriber({
    required this.uuid,
    required this.topic,
    required this.onTopic,
    this.active = true,
  });

  FkafkaSubscriber copyWith({
    String? uuid,
    String? topic,
    OnTopicCallBack? onTopic,
    bool? active,
  }) {
    return FkafkaSubscriber(
      uuid: uuid ?? this.uuid,
      topic: topic ?? this.topic,
      onTopic: onTopic ?? this.onTopic,
      active: active ?? this.active,
    );
  }
}
