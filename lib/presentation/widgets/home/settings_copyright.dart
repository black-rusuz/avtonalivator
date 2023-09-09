import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Avatar extends StatelessWidget {
  final String url;
  final Color color;

  const Avatar({
    Key? key,
    required this.url,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 27,
      backgroundColor: color,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: CachedNetworkImage(
          imageUrl: url,
          imageBuilder: ((_, img) => CircleAvatar(
                radius: 100,
                foregroundImage: img,
                backgroundColor: Colors.white,
              )),
        ),
      ),
    );
  }
}

class SettingsCopyright extends StatelessWidget {
  const SettingsCopyright({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Avatar(
              url: 'https://github.com/gsusha.png',
              color: Color(0xFF71C285),
            ),
            SizedBox(width: 15),
            Avatar(
              url: 'https://github.com/black-rusuz.png',
              color: Color(0xFFFF7373),
            ),
          ],
        ),
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            style: GoogleFonts.comfortaa(
              color: const Color(0xFF7B7F9E),
              fontWeight: FontWeight.bold,
            ),
            text: 'design by ',
            children: const [
              TextSpan(
                text: 'gsusha',
                style: TextStyle(color: Color(0xFF71C285)),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            style: GoogleFonts.comfortaa(
              color: const Color(0xFF7B7F9E),
              fontWeight: FontWeight.bold,
            ),
            text: 'coded by ',
            children: const [
              TextSpan(
                text: 'black-rusuz',
                style: TextStyle(color: Color(0xFFFF7373)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
