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
  fkafka: 0.1.0
```

```dart
import 'package:fkafka/fkafka.dart';

final kafka = Fkafka();
```

Then, if you want to emit something...

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

To listen emited topic...

```dart
final kafka = Fkafka();

kafka.on(
  TulTopics.cart,
  (TopicData topic) {
    print(topic);
  },
);

```
