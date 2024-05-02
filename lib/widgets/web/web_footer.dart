import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final labelSet01 = <String>{
      "About",
      "Advertising",
      "Business",
      "How Search Works",
    };

    final labelSet02 = <String>{
      "Privacy",
      "Terms",
      "Settings",
    };

    return Column(
      children: [
        Container(
          color: footerColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(children: [
              Text(
                "Pakistan",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                ),
              ),
            ]),
          ),
        ),
        const Divider(
          height: 0,
          thickness: 1,
        ),
        Container(
          color: footerColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (final label in labelSet01) _footerText(label),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (final label in labelSet02) _footerText(label),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _footerText(String label) {
    return TextButton(
      onPressed: () {},
      child: Text(
        label,
        style: const TextStyle(
          color: primaryColor,
        ),
      ),
    );
  }
}
