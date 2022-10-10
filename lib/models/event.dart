part of 'package:fkafka/fkafka.dart';

class FkafkaEvent extends Equatable {
  const FkafkaEvent({
    required this.topic,
    required this.topicData,
  });

  final String topic;
  final TopicData topicData;

  @override
  List<Object?> get props => [
        topic,
        topicData,
      ];
}
