part of 'package:fkafka/fkafka.dart';

abstract class FkafkaProducer<T> {
  final kafka = Fkafka();

  void emit(String topic, T data) {
    kafka.emit<T>(topic, data);
  }
}
