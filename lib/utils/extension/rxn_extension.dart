import 'dart:async';

import 'package:card_scanner/ui/card/object_extensions.dart';
import 'package:get/get.dart';

extension RxnExtensions<T> on Rxn<T> {
  // When we want to listen for a non null value, Rxn isn't configured,
  // and this might simplify the syntax when reading
  // Will return null if it's been listened again and [listenAgain] is false
  StreamSubscription<T?>? listenOnceWhenNotNull(Function(T) onValue,
      {bool listenAgain = false}) {
    if (subject.hasListeners && !listenAgain) {
      return null;
    }

    return listen((T? value) {
      value?.let((that) => onValue(that));
    });
  }
}
