import 'package:bouncy_listener/bouncy_listener.dart';
import 'package:test/test.dart';

void main() {
  test('Bouncy listener', () async {

    bool callbackCalled = false;

    BouncyListener debouncer = BouncyListener(() => callbackCalled = true, const Duration(seconds: 1),);

    // Delay by 1.5s
    debouncer.input();
    await Future.delayed(const Duration(milliseconds: 500));
    expect(callbackCalled, false);

    debouncer.input();
    await Future.delayed(const Duration(milliseconds: 500));
    expect(callbackCalled, false);

    debouncer.input();
    await Future.delayed(const Duration(milliseconds: 500));
    expect(callbackCalled, false);

    // Actually let the debouncer complete
    await Future.delayed(const Duration(milliseconds: 600));
    expect(callbackCalled, true);

  });
}
