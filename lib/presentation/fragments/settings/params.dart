part of 'settings.dart';

class _Params {
  final BuildContext context;
  late final List<Param> list;

  _Params(this.context) {
    final settings = context.watch<SettingsProvider>();
    final connection = context.read<ConnectionProvider>();

    list = [
      Param.stored(
        provider: settings,
        key: ParamKey.autoConnect,
        title: Strings.autoConnectTitle,
        description: Strings.autoConnectDescription,
        defaultValue: true,
      ),
      Param.stored(
        provider: settings,
        key: ParamKey.drinksQuantity,
        title: Strings.drinksQuantityTitle,
        defaultValue: 6,
        onChanged: (v) => context.read<TuningProvider>().createCocktail(v),
      ),
      Param.deviceModal(
        key: ParamKey.calibration,
        title: Strings.calibrateTitle,
        onTap: () => showDialog(
          context: context,
          builder: (_) => ChangeNotifierProvider.value(
            value: context.read<ConnectionProvider>(),
            child: CalibrationDialog(),
          ),
        ),
      ),
      Param.deviceModal(
        key: ParamKey.lightningMode,
        title: Strings.lightningMode,
        onTap: () => showDialog(
          context: context,
          builder: (_) => ChangeNotifierProvider.value(
            value: context.read<ConnectionProvider>(),
            child: const LightningDialog(),
          ),
        ),
      ),
      Param.deviceAction(
        key: ParamKey.lightningBrightness,
        title: Strings.lightningBrightness,
        sendValue: (v) => connection.setLightningBrightness(v),
      ),
    ];

    const typesMap = ParamKey.typesMap;
    assert(list.length == typesMap.keys.length);
  }
}
