extension StringCasingExtension on String? {
  String capitalize() {
    if (isNullOrEmpty()) return this!;
    return this![0].toUpperCase() + this!.substring(1);
  }

  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}
