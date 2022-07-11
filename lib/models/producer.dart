part of 'package:fkafka/fkafka.dart';

abstract class FkafkaProducer {
  final kafka = Fkafka();

  void created(String topic, Map<String, dynamic> data) {
    kafka.emit(
      topic,
      TopicData(
        action: FkafkaAction.created,
        data: data,
      ),
    );
  }

  void edited(String topic, Map<String, dynamic> data) {
    kafka.emit(
      topic,
      TopicData(
        action: FkafkaAction.edited,
        data: data,
      ),
    );
  }

  void deleted(String topic, Map<String, dynamic> data) {
    kafka.emit(
      topic,
      TopicData(
        action: FkafkaAction.deleted,
        data: data,
      ),
    );
  }

  void changed(String topic, Map<String, dynamic> data) {
    kafka.emit(
      topic,
      TopicData(
        action: FkafkaAction.changed,
        data: data,
      ),
    );
  }
}
