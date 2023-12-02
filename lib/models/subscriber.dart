part of 'package:fkafka/fkafka.dart';

class FkafkaSubscriber<T> extends Equatable {
  const FkafkaSubscriber({
    required this.isActive,
    required this.onTopic,
    required this.subscription,
  });

  final bool isActive;
  final OnTopicCallBack<T> onTopic;
  final StreamSubscription<FkafkaEvent<T>> subscription;

  FkafkaSubscriber<T> copyWith({
    bool? isActive,
    OnTopicCallBack<T>? onTopic,
    StreamSubscription<FkafkaEvent<T>>? subscription,
  }) {
    return FkafkaSubscriber<T>(
      isActive: isActive ?? this.isActive,
      onTopic: onTopic ?? this.onTopic,
      subscription: subscription ?? this.subscription,
    );
  }

  @override
  List<Object?> get props {
    return [
      isActive,
      onTopic,
      subscription,
    ];
  }
}
