extension EqualsIgnoreCase on String {
  bool equals(String other) {
    return toLowerCase() == other.toLowerCase();
  }
}
