import 'package:bouncy_listener/bouncy_listener.dart';

void main() async {

  bool callbackCalled = false;

  void callback() {
    callbackCalled = true;
    print('Callback called');
  }

  BouncyListener debouncer = BouncyListener(callback, const Duration(seconds: 1),);

  // First call
  debouncer.input();

  // Call again after less time then the specified duration
  await Future.delayed(const Duration(milliseconds: 500));
  debouncer.input();
  await Future.delayed(const Duration(milliseconds: 600));

  // callbackCalled is still false
  print('callbackCalled is $callbackCalled');

  // Wait for the debounce to finish
  await Future.delayed(const Duration(milliseconds: 500));
  print('callbackCalled is $callbackCalled');
}
