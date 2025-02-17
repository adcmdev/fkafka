library fkafka;

import 'dart:async';

import 'package:equatable/equatable.dart';

part 'package:fkafka/models/event.dart';
part 'package:fkafka/models/producer.dart';
part 'package:fkafka/models/subscriber.dart';

typedef OnTopicCallBack<T> = void Function(T topic);

class Fkafka {
  static final Map<String, StreamController<FkafkaEvent>> _controllers = {};

  final Map<String, List<FkafkaSubscriber>> _subscribers = {};

  /// Should be called whenever Fkafka itself is not going to be
  /// used anymore.
  static void closeAll() {
    for (final controller in _controllers.values) {
      controller.close();
    }
    _controllers.clear();
  }

  /// Emit an event to all subscribers of [topic].
  void emit<T>(String topic, T data) {
    _controllers.putIfAbsent(
      topic,
      () => StreamController.broadcast(),
    );

    _controllers[topic]!.add(
      FkafkaEvent<T>(
        topic: topic,
        data: data,
      ),
    );
  }

  /// Add a subscription to the [topic]
  void listen<T>(
    String topic, {
    required OnTopicCallBack<T> onTopic,
  }) {
    _controllers.putIfAbsent(
      topic,
      () => StreamController.broadcast(),
    );
    _subscribers.putIfAbsent(
      topic,
      () => [],
    );

    final subscription = _controllers[topic]!.stream.listen(
      (event) {
        onTopic(event.data);
      },
    );

    _subscribers[topic]!.add(
      FkafkaSubscriber<T>(
        isActive: true,
        onTopic: onTopic,
        subscription: subscription,
      ),
    );
  }

  /// Pause all the subscriptions from this instance of Fkafka to
  /// the [topic].
  void pauseListeningTo({
    required String topic,
  }) {
    _controllers.putIfAbsent(
      topic,
      () => StreamController.broadcast(),
    );

    final subscribers = _subscribers[topic] ?? <FkafkaSubscriber>[];

    for (var i = 0; i < subscribers.length; i++) {
      final subscriber = subscribers[i];
      subscriber.subscription.cancel();

      subscribers[i] = subscriber.copyWith(
        isActive: false,
      );
    }
  }

  /// Resume all the subscriptions from this instance of Fkafka to
  /// the [topic].
  void resumeListeningTo({
    required String topic,
  }) {
    _controllers.putIfAbsent(
      topic,
      () => StreamController.broadcast(),
    );

    final subscribers = _subscribers[topic] ?? <FkafkaSubscriber>[];

    for (var i = 0; i < subscribers.length; i++) {
      final subscriber = subscribers[i];
      subscriber.subscription.cancel();

      final subscription = _controllers[topic]!.stream.listen(
        (event) {
          subscriber.onTopic(event.data);
        },
      );

      subscribers[i] = subscriber.copyWith(
        isActive: true,
        subscription: subscription,
      );
    }
  }

  /// Add a subscription to the [topics]
  /// [topics] should be a list of topics
  /// [onTopic] should be a callback that will be called whenever a
  /// new event is emitted from the [topics]
  void listenMultiple<T>({
    required List<String> topics,
    required OnTopicCallBack onTopic,
  }) {
    for (final topic in topics) {
      listen<T>(
        topic,
        onTopic: onTopic,
      );
    }
  }

  /// Pause all the subscriptions from this instance of Fkafka to
  /// the [topics]
  void pauseListeningToMultiple({
    required List<String> topics,
  }) {
    for (final topic in topics) {
      pauseListeningTo(
        topic: topic,
      );
    }
  }

  /// Check if there is at least one active subscription to the
  /// [topic] in this instance of Fkafka.
  bool isListeningTo({
    required String topic,
  }) {
    return _subscribers[topic]?.isNotEmpty == true &&
        _subscribers[topic]!.any(
          (subscriber) => subscriber.isActive,
        );
  }

  /// Should be called whenever the instance of this Fkafka object is
  /// not going to be used anymore.
  void closeInstance() {
    for (final subscribers in _subscribers.values) {
      for (final subscriber in subscribers) {
        subscriber.subscription.cancel();
      }
    }
    _subscribers.clear();
  }
}
