import 'package:flutter/material.dart';
import 'package:flutter_application_current_affairs/utils/app_colors.dart';
import 'package:flutter_application_current_affairs/utils/appstrings.dart';

class CateContainer extends StatelessWidget {
  final Function() press;
  final int yearsdetails;
  final Color color;
  const CateContainer(
      {Key? key,
      required this.yearsdetails,
      required this.press,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: press,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                color: color,
                child: Center(
                  child: Text(
                    '$appTitle $yearsdetails',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
