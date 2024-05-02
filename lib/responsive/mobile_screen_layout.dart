import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_clone/colors.dart";
import 'package:google_clone/widgets/search.dart';
import "package:google_clone/widgets/mobile/mobile_footer.dart";

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery helps you get the different information about the device
    // on which the app is running. Such as you can get the screen size,
    // screen orientation, disable animations, device font size and many
    //more about the user prefrences.

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          title: SizedBox(
            width: size.width * 0.35,
            child: const DefaultTabController(
              length: 2,
              child: TabBar(
                labelColor: blueColor,
                indicatorColor: blueColor,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "ALL"),
                  Tab(text: "IMAGES"),
                ],
              ),
            ),
          ),
          actions: [
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
          ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.30,
            ),
            const Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Search(),
                    MobileFooter(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
