extension SearchSubstring on String {
  bool search(String pattern) {
    final value = pattern.toLowerCase();
    final result = toLowerCase().startsWith(value);
    return result;
  }

  bool searchIn(String pattern) {
    final value = pattern.toLowerCase();
    final result = value.startsWith(this);
    return result;
  }
}
