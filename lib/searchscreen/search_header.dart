import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/responsive/mobile_screen_layout.dart';
import 'package:google_clone/responsive/responsive_layout_screen.dart';
import 'package:google_clone/responsive/web_screen_layout.dart';
import 'package:google_clone/searchscreen/search_screen.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  final TextEditingController controller = TextEditingController(text: "");
  bool textFieldDivider = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: backgroundColor,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ResponsiveLayoutScreen(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 10, top: 5),
              child: Image.asset(
                "images/google-logo.png",
                height: 35,
                width: 95,
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            width: size.width <= 768 ? size.width * 0.60 : size.width * 0.50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: searchColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: searchColor,
              ),
            ),
            child: TextFormField(
              controller: controller,
              onFieldSubmitted: (query) {
                if (query != "") {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        searchQuery: query,
                        start: "0",
                      ),
                    ),
                  );
                }
              },
              onTapOutside: (event) {
                if (controller.text == "") {
                  textFieldDivider = false;
                }
                setState(() {});
              },
              onTap: () {
                setState(() {
                  textFieldDivider = true;
                });
              },
              style: const TextStyle(
                fontSize: 16,
              ),
              //textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (textFieldDivider)
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.clear();
                              textFieldDivider = false;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.backspace,
                              color: searchBorder,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              width: 0.7,
                              color: searchBorder,
                            ),
                          )
                        ],
                      ),
                    SvgPicture.asset(
                      "images/mic-icon.svg",
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    SvgPicture.asset(
                      "images/camera-icon.svg",
                      height: 25,
                      width: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        final String query = controller.text;
                        if (query != "") {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                searchQuery: query,
                                start: "0",
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.search,
                        color: blueColor,
                      ),
                    ),
                  ],
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
