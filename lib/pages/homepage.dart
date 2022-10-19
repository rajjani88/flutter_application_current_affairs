import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_current_affairs/utils/app_colors.dart';
import 'package:flutter_application_current_affairs/model/datamodel.dart';
import 'package:flutter_application_current_affairs/pages/categorypage.dart';
import 'package:flutter_application_current_affairs/pages/addque.dart';
import 'package:flutter_application_current_affairs/utils/appstrings.dart';
import 'package:flutter_application_current_affairs/widget/navigator_right.dart';
import 'package:flutter_application_current_affairs/widget/typescontainer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

List<DataModel> dataList = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    data = firestore.collection('data');
    getAllData();
  }

  getAllData() async {
    data!.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        DataModel d = DataModel.fromMap(doc.data());
        dataList.add(d);
      }
    }).onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolors,
        title: Text(appTitle),
        actions: [
          PopupMenuButton<MenuItem>(
              color: Colors.black,
              onSelected: (value) {},
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: Text(
                        moreApps,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    PopupMenuItem(
                      child: Text(
                        shareWith,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    PopupMenuItem(
                      child: Text(
                        checkUpdates,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ])
        ],
      ),
      body: isLoading
          ? const SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(),
            )
          : Body1(),
    );
  }
}

class Body1 extends StatelessWidget {
  Body1({
    Key? key,
  }) : super(key: key);

  final List title = [appTitle, video, moreApps];
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView(
        children: [
          Padding(
            padding: padding,
            child: Column(
              children: [
                TypesContainer(
                  title: title[0],
                  bcolor: Colors.grey,
                  press: () {
                    Navigator.of(context).push(
                      CustomPageRoute(
                        child: const CategoryPage(),
                      ),
                    );
                  },
                ),
                sizeBox,
                TypesContainer(
                    title: title[1], bcolor: Colors.blue, press: () {}),
                sizeBox,
                TypesContainer(
                    title: title[2],
                    bcolor: const Color.fromARGB(255, 7, 101, 177),
                    press: () {}),
                sizeBox,
                TypesContainer(
                    title: addQue,
                    bcolor: const Color.fromARGB(255, 7, 101, 177),
                    press: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) {
                          return const AddQue();
                        },
                      ));
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
