import 'package:flutter/material.dart';
import 'package:flutter_application_current_affairs/utils/app_colors.dart';
import 'package:flutter_application_current_affairs/pages/quotestionpages.dart';
import 'package:flutter_application_current_affairs/utils/appstrings.dart';
import 'package:flutter_application_current_affairs/widget/navigator_right.dart';
import 'package:flutter_application_current_affairs/widget/subcatcontainer.dart';

class SubCategoryPage extends StatelessWidget {
  final int year;
  SubCategoryPage({super.key, required this.year});

  final List<String> subCat = [
    'जनवरी',
    'फरवरी',
    'मार्च',
    'अप्रैल',
    'मई',
    'जून',
    'जुलाई',
    'अगस्त',
    'सितम्बर',
    'अक्टूबर',
    'नवम्बर',
    'दिसंबर',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors,
        title: Text('$appTitle $year'),
      ),
      body: ListView.builder(
          itemCount: subCat.length,
          itemBuilder: (BuildContext context, int index) {
            return SubCatContainer(
              monthsdetails: subCat[index],
              press: () {
                Navigator.of(context).push(CustomPageRoute(
                    child: Questions(
                  year: year,
                  month: subCat[index],
                )));
              },
              color: monthTileColors[index],
            );
          }),
    );
  }
}
