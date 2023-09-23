part of '../settings.dart';

class SettingsAppBar extends StatelessWidget {
  final UiDevice? device;
  final double height;
  final bool isConnecting;
  final VoidCallback? onTap;

  const SettingsAppBar({
    super.key,
    this.device,
    required this.height,
    required this.isConnecting,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: height,
      backgroundColor: device == null ? AppTheme.accent : AppTheme.background,
      title: Text(Strings.settings, style: AppTheme.pageTitle),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: BarmenCard(
              title: device?.name ?? device?.address,
              subtitle: device?.address,
              isConnecting: isConnecting,
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
