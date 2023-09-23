part of '../scan.dart';

class _ScanBody extends StatelessWidget {
  final ScanFulfilled state;
  final bool isConnecting;

  const _ScanBody({
    required this.state,
    required this.isConnecting,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final statusBar = mediaQuery.viewPadding.top;
    final appBar = mediaQuery.size.height * 0.4;

    return RefreshIndicator(
      edgeOffset: appBar + statusBar,
      onRefresh: () async => context.read<ScanCubit>().scan(),
      child: SliverScaffold(
        sliverAppBar: ScanAppBar(
          isConnecting: isConnecting,
          height: appBar,
        ),
        bodyBuilder: (_, c) {
          return DeviceList(
            minHeight: mediaQuery.size.height * 0.6 - statusBar,
            devices: state.devices,
            onItemTap: (device) => _connectToDevice(context, device),
          );
        },
      ),
    );
  }
}
