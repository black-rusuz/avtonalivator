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
        key: ParamKey.drinksQuantity,
        title: Strings.drinksQuantityTitle,
        defaultValue: 6,
        onChanged: (v) => context.read<TuningProvider>().generateDrinks(v),
      ),
      Param.device(
        title: Strings.calibrateTitle,
        onTap: () => showDialog(
          context: context,
          builder: (_) => RepositoryProvider.value(
            value: context.read<DeviceMethods>(),
            child: CalibrationDialog(),
          ),
        ),
      ),
    ];

    const typesMap = ParamKey.typesMap;
    assert(list.length == typesMap.keys.length);
  }
}
