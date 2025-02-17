// ignore_for_file: avoid_print

import 'dart:async';

import 'package:fkafka/fkafka.dart';

void main() async {
  runZonedGuarded(
    () async {
      const testTopic = 'test_topic';

      var i = 0;

      final fkafka1 = Fkafka();
      fkafka1.listen(
        testTopic,
        onTopic: (_) {
          i++;
        },
      );

      final fkafka2 = Fkafka();
      fkafka2.listen(
        testTopic,
        onTopic: (_) {
          throw Exception();
        },
      );

      final fkafka3 = Fkafka();
      fkafka3.listen(
        testTopic,
        onTopic: (_) {
          i++;
        },
      );

      final fkafkaEmitter = Fkafka();
      fkafkaEmitter.emit(testTopic, "");

      await Future.delayed(const Duration(seconds: 2));
      print(i == 2);

      var isListening = fkafka1.isListeningTo(
        topic: testTopic,
      );
      print(isListening == true);
      fkafka1.pauseListeningTo(
        topic: testTopic,
      );
      isListening = fkafka1.isListeningTo(
        topic: testTopic,
      );
      print(isListening == false);

      fkafkaEmitter.emit(testTopic, "");

      await Future.delayed(const Duration(seconds: 2));
      print(i == 3);

      fkafka1.resumeListeningTo(
        topic: testTopic,
      );
      isListening = fkafka1.isListeningTo(
        topic: testTopic,
      );
      print(isListening == true);

      fkafka1.closeInstance();
      fkafka2.closeInstance();
      fkafka3.closeInstance();
      fkafkaEmitter.closeInstance();

      Fkafka.closeAll();
    },
    (_, __) {},
  );
}
