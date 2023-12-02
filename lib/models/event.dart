part of 'package:fkafka/fkafka.dart';

class FkafkaEvent<T> extends Equatable {
  const FkafkaEvent({
    required this.topic,
    required this.data,
  });

  final String topic;
  final T data;

  @override
  List<Object?> get props {
    return [
      topic,
      data,
    ];
  }
}
