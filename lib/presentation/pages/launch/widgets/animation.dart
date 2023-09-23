part of '../launch.dart';

const _duration = Duration(milliseconds: 750);

class LaunchAnimation extends StatelessWidget {
  final bool animate;

  const LaunchAnimation({super.key, required this.animate});

  static final launchHeader = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static final launchSubheader = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: AppTheme.accent,
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeOutCubic,
            duration: _duration,
            top: !animate ? 100 : 170,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AnimatedText(
                  Strings.autoBartender,
                  duration: _duration,
                  style: launchHeader.copyWith(
                    color: !animate ? Colors.transparent : AppTheme.black,
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedText(
                  Strings.description,
                  duration: _duration,
                  style: launchSubheader.copyWith(
                    color: !animate ? Colors.transparent : AppTheme.black,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Stack(
              children: [
                BasicImage(AssetsIcon.barmen.path),
                AnimatedPositioned(
                  duration: _duration,
                  curve: Curves.easeInQuart,
                  top: !animate ? 26 : 48,
                  left: 86.5,
                  child: const Text(
                    '•',
                    style: TextStyle(fontSize: 20, color: AppTheme.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
