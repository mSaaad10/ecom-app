extension HttpExtension on int {
  bool get isSuccessRequest => this >= 200 && this < 300;
}
