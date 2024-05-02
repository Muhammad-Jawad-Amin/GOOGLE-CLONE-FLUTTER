import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_clone/colors.dart";
import 'package:google_clone/widgets/search.dart';
import "package:google_clone/widgets/web/web_footer.dart";

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final searchButtonLabels = <String>{"Google Search", "I'm Feeling Lucky."};

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Gamil",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: primaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Iamges",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "images/more-apps.svg",
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MaterialButton(
            onPressed: () {},
            color: const Color.fromARGB(255, 147, 186, 249),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              "Sign in",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: footerColor,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Search(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (final label in searchButtonLabels)
                        _searchButtonCreator(label),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _translationButtonsCreator(),
                ],
              ),
            ),
            const WebFooter(),
          ],
        ),
      ),
    );
  }

  Widget _searchButtonCreator(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: MaterialButton(
        onPressed: () {},
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 25,
        ),
        color: searchColor,
        child: Text(label),
      ),
    );
  }

  Widget _translationButtonsCreator() {
    final languageLabels = <String>{'اردو', "پښتو", 'سنڌي'};

    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        const Text("Google offered in:"),
        const SizedBox(width: 10),
        for (final lable in languageLabels) _languageTextCreator(lable),
      ],
    );
  }

  Widget _languageTextCreator(String lable) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () {},
        child: Text(
          lable,
          style: const TextStyle(
            color: blueColor,
          ),
        ),
      ),
    );
  }
}
