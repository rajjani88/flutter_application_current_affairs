import 'package:flutter/material.dart';
import 'package:flutter_application_current_affairs/utils/app_colors.dart';
import 'package:flutter_application_current_affairs/model/datamodel.dart';
import 'package:flutter_application_current_affairs/pages/homepage.dart';
import 'package:flutter_application_current_affairs/utils/appstrings.dart';
import 'package:flutter_application_current_affairs/widget/quecontainer.dart';

class Questions extends StatefulWidget {
  final String month;
  final int year;
  const Questions({super.key, required this.year, required this.month});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool isChecked = false;
  List<int> checkedList = [];
  List<DataModel> queList = [];

  querySelectedQueList() {
    for (var element in dataList) {
      if (element.category == widget.year &&
          element.subCategory == widget.month) {
        queList.add(element);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    querySelectedQueList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors,
        title: Text('$appTitle ${widget.year} - ${widget.month}'),
        actions: [
          PopupMenuButton<MenuItem>(
              color: Colors.black,
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Row(
                      children: [
                        const Text(
                          'Show All Answer',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Checkbox(
                          side: const BorderSide(width: 2, color: Colors.grey),
                          value: isChecked,
                          onChanged: (bool? value) {
                            Navigator.pop(context);
                            //add all
                            if (isChecked) {
                              isChecked = false;
                              checkedList.clear();
                            } else {
                              for (var i = 0; i < queList.length; i++) {
                                checkedList.add(i);
                              }
                            }
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ],
                    )),
                  ])
        ],
      ),
      body: ListView.builder(
          itemCount: queList.length,
          itemBuilder: (BuildContext context, int index) {
            return QueContainer(
              value: checkedList.contains(index),
              index: ' ${index + 1}',
              modeldetails: queList[index],
              action: () {
                if (checkedList.contains(index)) {
                  //if already remove
                  checkedList.remove(index);
                } else {
                  checkedList.add(index);
                }
                //add selected index

                setState(() {});
              },
            );
          }),
    );
  }
}
