extension IntExt on int {
  String formatNumber({int length = 4}) {
    return toString().padLeft(length, '0');
  }
}
