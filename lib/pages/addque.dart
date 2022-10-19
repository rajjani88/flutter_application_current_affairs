import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_current_affairs/model/datamodel.dart';
import 'package:flutter_application_current_affairs/utils/appstrings.dart';

class AddQue extends StatefulWidget {
  const AddQue({super.key});

  @override
  State<AddQue> createState() => _AddQueState();
}

class _AddQueState extends State<AddQue> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? data;

  List<int> mainCat = [];
  int selectCat = 2010;

  List<String> subCat = [
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

  String selectedSubCat = 'जनवरी';

  TextEditingController queCont = TextEditingController();
  TextEditingController ansCont = TextEditingController();
  String err = '';

  bool isLoading = false;

  fillMainCat() {
    for (var i = startYear; i < lastYear; i++) {
      mainCat.add(i);
    }
  }

  @override
  void initState() {
    super.initState();
    fillMainCat();
    data = firestore.collection('data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Que'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //year selection
          const Text('Select Category'),
          Center(
            child: DropdownButton(
                value: selectCat,
                items: mainCat
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text('$appTitle $e'),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectCat = val ?? 2010;
                  });
                }),
          ),
          const SizedBox(
            height: 14,
          ),
          //year selection
          Text(selectSubCat),
          Center(
            child: DropdownButton(
                value: selectedSubCat,
                items: subCat
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedSubCat = val ?? selectedSubCat[0];
                  });
                }),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            padding: const EdgeInsets.all(14),
            child: TextField(
              controller: queCont,
              decoration: const InputDecoration(hintText: 'Add New Question'),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: TextField(
              controller: ansCont,
              decoration: const InputDecoration(hintText: 'Add Answare'),
            ),
          ),
          Text(
            err,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),

          isLoading
              ? const SizedBox(
                  height: 34, width: 34, child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      err = '';
                    });
                    if (queCont.text.isEmpty) {
                      setState(() {
                        err = 'Enter Que';
                      });

                      return;
                    }
                    if (ansCont.text.isEmpty) {
                      setState(() {
                        err = 'Enter answare';
                      });
                      return;
                    }

                    DataModel d = DataModel(
                        category: selectCat,
                        subCategory: selectedSubCat,
                        question: queCont.text.trim(),
                        ans: ansCont.text.trim());
                    setState(() {
                      isLoading = true;
                    });

                    data!.add(d.toMap()).then((value) {
                      log('doc ref ${value.id}');
                      setState(() {
                        isLoading = false;
                      });
                    }).onError((error, stackTrace) {
                      log('error : $error');
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: const Text('Save'))
        ],
      ),
    );
  }
}
