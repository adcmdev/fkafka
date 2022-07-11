part of 'package:fkafka/fkafka.dart';

abstract class FkafkaProducer {
  final kafka = Fkafka();

  void created(String topic, Map<String, dynamic> data) {
    kafka.emit(
      topic,
      TopicData(
        action: KafkaAction.created,
        data: data,
      ),
    );
  }

  void edited(String topic, Map<String, dynamic> data) {
    kafka.emit(
      topic,
      TopicData(
        action: KafkaAction.edited,
        data: data,
      ),
    );
  }

  void deleted(String topic, Map<String, dynamic> data) {
    kafka.emit(
      topic,
      TopicData(
        action: KafkaAction.deleted,
        data: data,
      ),
    );
  }

  void changed(String topic, Map<String, dynamic> data) {
    kafka.emit(
      topic,
      TopicData(
        action: KafkaAction.changed,
        data: data,
      ),
    );
  }
}
