//type containers
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TypesContainer extends StatelessWidget {
  final Function press;
  final String title;
  final Color bcolor;
  const TypesContainer(
      {Key? key,
      required this.title,
      required this.bcolor,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              press();
            },
            child: AnimationConfiguration.staggeredGrid(
              position: 4,
              columnCount: 4,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 3000),
                child: Container(
                  decoration: BoxDecoration(
                      color: bcolor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  height: 200,
                  child: Center(
                      child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
