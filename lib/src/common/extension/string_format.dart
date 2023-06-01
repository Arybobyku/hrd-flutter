extension StringFormatMixin on String?{
  String get firstLetter {
    return this?[0] ?? "";
  }
}
