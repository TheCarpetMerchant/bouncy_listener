import 'dart:async';


/// [callback] will be called after waiting for [duration] when [input] is called.
/// If [input] is called again before [duration] is elapsed, the timer restarts.
/// So calling [input] every 500ms during 2s with a [duration] of 1s will result
/// in a total debounce of 3s.
///
/// Example :
/// ```dart
/// TextEditingController.addListener(BouncyListener(callback, const Duration(milliseconds: 100))..input);
/// ```
class BouncyListener {

  Timer? _timer;
  void Function() callback;
  Duration duration;

  BouncyListener(this.callback, this.duration);

  /// Pass this to [TextEditingController.addListener], for example.
  void input() {
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }

  /// Cancels the currently waiting callback.
  void cancel() => _timer?.cancel();

}