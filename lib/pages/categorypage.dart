import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_current_affairs/utils/app_colors.dart';
import 'package:flutter_application_current_affairs/pages/subcategorypage.dart';
import 'package:flutter_application_current_affairs/utils/appstrings.dart';
import 'package:flutter_application_current_affairs/widget/catcontainer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
//for selecting years
  List<int> mainCat =
      List.generate(lastYear - startYear, (index) => startYear + index);

  //manage count of color;
  int colorCount = 0;

  //
  generateRandomColor() {
    Random r = Random();
    int t = r.nextInt(tileColors.length - 1);
    if (t != colorCount) {
      colorCount = t;
    } else {
      generateRandomColor();
    }
  }

  @override
  void initState() {
    super.initState();
    mainCat = mainCat.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors,
        title: Text(appTitle),
      ),
      body: ListView.builder(
          //reverse: true,
          itemCount: mainCat.length,
          itemBuilder: (BuildContext context, int index) {
            generateRandomColor();
            return CateContainer(
                yearsdetails: mainCat[index],
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => SubCategoryPage(year: mainCat[index])));
                },
                color: tileColors[colorCount]);
          }),
    );
  }
}
