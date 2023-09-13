import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension WidgetRxExtensions<T, R> on Rx<T> {
  ObxValue build(Widget Function(T) builder) {
    return ObxValue<Rx<T>>((Rx<T> a) {
      return builder(a.value);
    }, this);
  }
}
