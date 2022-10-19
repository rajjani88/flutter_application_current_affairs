import 'package:flutter/material.dart';
import 'package:flutter_application_current_affairs/utils/app_colors.dart';

class SubCatContainer extends StatelessWidget {
  final Function() press;
  final String monthsdetails;
  final Color color;
  const SubCatContainer(
      {Key? key,
      required this.monthsdetails,
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
                height: 50,
                color: color,
                child: Center(
                  child: Text(
                    monthsdetails,
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
