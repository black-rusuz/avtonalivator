part of '../scan.dart';

class _KnownDeviceSheet extends StatelessWidget {
  final ScanAutoConnect state;

  const _KnownDeviceSheet({required this.state});

  UiDevice get device => state.knownDevice;

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      height: AppTheme.listPadding.vertical +
          AppTheme.listPadding.vertical +
          29 +
          108,
      padding: AppTheme.listPadding,
      shadow: const BoxShadow(
        color: Colors.black,
        offset: Offset(0, -10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppTheme.listPadding,
            child: Text(
              Strings.knownDeviceFound,
              style: AppTheme.pageTitle,
            ),
          ),
          BarmenCard(
            title: device.name ?? device.address,
            isConnecting: state.isConnecting,
            onTap: () => _connectToDevice(context, device),
          ),
        ],
      ),
    );
  }
}
