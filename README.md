## Bouncy listener

An easy to use, autocancellable debouncer.

## Usage

```dart
TextEditingController.addListener(
  BouncyListener(
    callback,
    const Duration(milliseconds: 100),
  )..input,
);
```