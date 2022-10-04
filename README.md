Have you ever wanted to send a message to another part of the app but don't want to create a direct connection?
This package allows you to send and listen topic anywhere.
Can connect to any topic in anywhere and get data without direct direction.

## Features

- Emit topic and send data.
- Listen topic and recieve data.
- Close topic listen.
- ReOpen connection when is already closed.

## Getting started

### Instructions

- Open a command line and cd to your projects root folder
- In your pubspec, add an entry for fkafka to your dependencies (example below)
- flutter pub get

## Usage

### Pubspec
There are 2 options. Directly from git, or from pub.dartlang.org

pub.dartlang.org: (you can use 'any' instead of a version if you just want the latest always)

```yaml
dependencies:
  fkafka: 1.0.0
```

```dart
import 'package:fkafka/fkafka.dart';

final kafka = Fkafka();
```

## Emit

```dart
kafka.emit(
  topic,
  TopicData(
    action: FkafkaAction.created // created, edited, deleted, changed,
    data: {
      'foo': 'bar'
    },
  ),
);
```

## Listen

To listen an specific topic you need to create a `Fkafka` instance.

```dart
final kafka = Fkafka();

kafka.listen(
  TulTopics.cart,
  (TopicData topic) {
    print(topic);
  },
);
```

Don't forget to close the instance if it's not going to be used anymore. This will cancel all the subscriptions added to that instance.

```dart
kafka.closeInstance();
```

## Close Fkafka

This method should be called if Fkafka won't be used anymore in the code, to avoid having open streams or memory leaks.

```
Fkafka.closeAll();
```

