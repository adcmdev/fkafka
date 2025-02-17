# Fkafka Dart Package

The `fkafka` package offers an elegant solution for sending messages across different parts of your Dart or Flutter application without establishing direct connections. It simplifies event-driven programming by allowing you to emit and listen to topics anywhere in your app.

## Features

- **Emit Topics**: Easily broadcast data across different parts of your app.
- **Listen to Topics**: Set up listeners for specific topics and react to the data received.
- **Control Listeners**: Ability to pause, resume, or close topic listeners.
- **Reconnect Capability**: Automatically re-establish connections when they are closed.

## Getting Started

To get started with `fkafka`, add it to your project's dependencies:

### For Flutter Projects
```console
flutter pub add fkafka
```

### For Dart Projects
```console
dart pub add fkafka
```

Or manually add it to your `pubspec.yaml` file:

```yaml
dependencies:
  fkafka: ^2.0.0
```

## Usage

Import the package and create an instance of `Fkafka`:

```dart
import 'package:fkafka/fkafka.dart';

final kafka = Fkafka();
```

### Emitting Data

In this example, we're emitting a list of products:

```dart
// Assuming Product is a defined class
final List<Product> products = [
  Product(name: 'phone', type: 'iphone', price: 1500.0),
];

// Emitting a list of products on the 'products.loaded' topic
kafka.emit('products.loaded', products);
```

### Listening to Topics

Set up a listener for the 'products.loaded' topic:

```dart
final kafka = Fkafka();

// Listening for the list of products
kafka.listen<List<Product>>(
  'products.loaded',
  onTopic: (List<Product> products) {
    // Handle the received list of products
    print(products);
  },
);
```

Remember to close the instance when it's no longer needed:

```dart
kafka.closeInstance();
```

### Listening to Multiple Topics

You can listen to multiple topics at once:

```dart
kafka.listenMultiple<T>(
  topics: ['products.loaded', 'orders.placed'],
  onTopic: (T data) {
    // Handle the received data
    print(data);
  },
);
```

### Pausing multiple Listeners

You can pause all the listeners for multiple topics at once:

```dart
kafka.pauseListeningToMultiple(
  topics: ['products.loaded', 'orders.placed'],
);
```

### Managing Fkafka Instance

To close all Fkafka instances and release resources:

```dart
Fkafka.closeAll();
```

## Advanced Usage

- **Pausing and Resuming Subscriptions**: Control your topic listeners by pausing and resuming them as needed.
- **Check Active Listeners**: Verify if a topic has active listeners in a particular instance.

## Contributing

Contributions to the `fkafka` package are welcome. Please read our contributing guidelines for more information.

## License

This project is licensed under the [MIT License](LICENSE).
