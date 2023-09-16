const _basePath = 'assets/icon';

enum AssetsIcon {
  barmen;

  String get path {
    return '$_basePath/$name.svg';
  }
}
