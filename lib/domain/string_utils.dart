extension SearchSubstring on String {
  /// Для удобочитаемости
  String get _this => this;

  bool has(String pattern) {
    final source = _this.toLowerCase();
    pattern = pattern.toLowerCase();
    final result = source.contains(pattern);
    return result;
  }

  bool equals(String other) {
    return toLowerCase() == other.toLowerCase();
  }

  bool search(String pattern) {
    final value = pattern.toLowerCase();
    final result = _this.toLowerCase().startsWith(value);
    return result;
  }

  bool searchIn(String source) {
    final value = source.toLowerCase();
    final result = value.startsWith(_this.toLowerCase());
    return result;
  }
}
