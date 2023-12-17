part of 'settings.dart';

class _Params {
  final BuildContext context;
  late final List<Param> list;

  _Params(this.context) {
    final provider = context.watch<SettingsProvider>();

    list = [
      Param.stored(
        provider: provider,
        key: ParamKey.autoConnect,
        title: Strings.autoConnectTitle,
        description: Strings.autoConnectDescription,
        defaultValue: true,
      ),
      Param.stored(
        provider: provider,
        key: ParamKey.pumpsQuantity,
        title: Strings.pumpsQuantityTitle,
        defaultValue: 6,
        onChanged: (v) => context.read<TuningProvider>().generatePumps(v),
      ),
      Param.tap(
        title: Strings.calibrateTitle,
        onTap: showCalibration,
      ),
    ];
  }

  void showCalibration() {
    showDialog(
      context: context,
      builder: (_) {
        return const CalibrationDialog();
      },
    );
  }
}
