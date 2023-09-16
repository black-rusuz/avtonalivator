part of '../start.dart';

const _duration = Duration(milliseconds: 750);

class StartAnimation extends StatelessWidget {
  final bool animate;

  const StartAnimation({super.key, required this.animate});

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
                  style: launchHeader,
                  duration: _duration,
                  animate: animate,
                ),
                AnimatedText(
                  Strings.description,
                  style: launchSubheader,
                  duration: _duration,
                  animate: animate,
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
                  top: !animate ? 29 : 52,
                  left: 87.5,
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
