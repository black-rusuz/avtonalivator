part of '../start.dart';

class StartStatus extends StatelessWidget {
  final bool btAvailable;
  final bool btEnabled;

  const StartStatus({
    super.key,
    required this.btAvailable,
    required this.btEnabled,
  });

  void requestEnable(BuildContext context) {
    context.read<StartCubit>().requestEnable();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: !btAvailable
          ? Text(
              Strings.btUnavailable,
              style: AppTheme.text,
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Text(
                    Strings.btDisabled,
                    style: AppTheme.text,
                  ),
                ),
                TextButton(
                  onPressed: () => requestEnable(context),
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.black,
                    backgroundColor: AppTheme.accent,
                    minimumSize: const Size(0, 60),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(Strings.enableBt),
                ),
              ],
            ),
    );
  }
}
