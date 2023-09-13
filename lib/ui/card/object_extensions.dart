extension ObjectExtensions<T> on T {
  R let<R>(R Function(T that) op) {
    return op(this);
  }
}
