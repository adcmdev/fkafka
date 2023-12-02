Have you ever wanted to send a message to another part of the app but don't want to create a direct connection?
This package allows you to send and listen topic anywhere.
Can connect to any topic in anywhere and get data without direct direction.

## Features

- Emit topic and send data.
- Listen topic and recieve data.
- Close topic listen.
- ReOpen connection when is already closed.

## Getting started

```console
# Flutter projects
flutter pub get fkafka

# Dart projects
dart pub get fkafka
```

or add the package directly in the `pubspec.yaml`

```yaml
dependencies:
  fkafka: ^2.0.0
```

## Usage

```dart
import 'package:fkafka/fkafka.dart';

final kafka = Fkafka();
```

## Emit

```dart
kafka.emit(
  'products.loaded',
  {
    'foo': 'bar'
  },
);

```

## Listen

To listen a specific topic you need to create a `Fkafka` instance.

```dart
final kafka = Fkafka();

kafka.listen(
  'products.loaded',
  onTopic: (Map<String, dynamic> topic) {
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

```dart
Fkafka.closeAll();
```

