// ignore_for_file: constant_identifier_names

const _basePath = 'assets/icon';

enum AssetsIcon {
  barmen,
  barmen_grey;

  String get path {
    return '$_basePath/$name.svg';
  }
}
