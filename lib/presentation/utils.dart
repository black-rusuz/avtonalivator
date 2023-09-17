extension SearchSubstring on String {
  /// Для удобочитаемости
  String get _this => this;

  bool search(String pattern) {
    final value = pattern.toLowerCase();
    final result = _this.toLowerCase().startsWith(value);
    return result;
  }

  bool searchIn(String pattern) {
    final value = pattern.toLowerCase();
    final result = value.startsWith(_this.toLowerCase());
    return result;
  }
}
