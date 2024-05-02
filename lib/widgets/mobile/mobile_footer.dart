import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final labelsSet = <String>{
      "About",
      "Advertising",
      "Business",
      "How Search Works",
      "Privacy",
      "Terms",
      "Settings",
    };

    return Column(
      children: [
        Container(
          color: footerColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(children: [
              Text(
                "Pakistan",
                style: TextStyle(
                  color: primaryColor,
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
          width: 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                for (final label in labelsSet) _footerText(label),
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
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: primaryColor,
        ),
      ),
    );
  }
}
