import "package:flutter/material.dart";

class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  const ResponsiveLayoutScreen(
      {super.key,
      required this.mobileScreenLayout,
      required this.webScreenLayout});

  @override
  Widget build(BuildContext context) {
    // Use layout builder when you want to create a  widget with respect
    // to the size or constraints of the parent widget. It also tells how
    // much spce a particular widget have available.

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return mobileScreenLayout;
        } else {
          return webScreenLayout;
        }
      },
    );
  }
}
