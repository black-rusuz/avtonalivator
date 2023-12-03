part of '../scan.dart';

class _KnownDeviceSheet extends StatelessWidget {
  final UiDevice device;
  final VoidCallback onTap;

  const _KnownDeviceSheet({
    required this.device,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      height: AppTheme.listPadding.vertical +
          AppTheme.paddingValue +
          29 +
          AppTheme.paddingValue +
          108,
      padding: AppTheme.listPadding,
      shadow: const BoxShadow(
        color: Colors.black,
        offset: Offset(0, -10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppTheme.paddingValue),
          Padding(
            padding: AppTheme.horizontalPadding,
            child: Text(
              Strings.knownDeviceFound,
              style: AppTheme.pageTitle,
            ),
          ),
          const SizedBox(height: AppTheme.paddingValue),
          BasicCard(
            onTap: onTap,
            color: AppTheme.background,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                BasicImage(AssetsIcon.barmen_grey.path, height: 68, width: 68),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.name ?? device.address,
                      style: AppTheme.text,
                    ),
                    const SizedBox(height: AppTheme.paddingValue),
                    Text(
                      device.address,
                      style: AppTheme.textLight,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
