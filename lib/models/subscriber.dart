part of 'package:fkafka/fkafka.dart';

class FkafkaSubscriber extends Equatable {
  const FkafkaSubscriber({
    required this.isActive,
    required this.onTopic,
    required this.subscription,
  });

  final bool isActive;
  final OnTopicCallBack onTopic;
  final StreamSubscription<FkafkaEvent> subscription;

  FkafkaSubscriber copyWith({
    bool? isActive,
    OnTopicCallBack? onTopic,
    StreamSubscription<FkafkaEvent>? subscription,
  }) {
    return FkafkaSubscriber(
      isActive: isActive ?? this.isActive,
      onTopic: onTopic ?? this.onTopic,
      subscription: subscription ?? this.subscription,
    );
  }

  @override
  List<Object?> get props => [
        isActive,
        onTopic,
        subscription,
      ];
}
