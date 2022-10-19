import 'package:flutter/material.dart';
import 'package:flutter_application_current_affairs/model/datamodel.dart';

class QueContainer extends StatefulWidget {
  final String index;
  final DataModel modeldetails;
  final Function() action;

  final bool value;
  const QueContainer(
      {Key? key,
      required this.index,
      required this.modeldetails,
      required this.value,
      required this.action})
      : super(key: key);

  @override
  State<QueContainer> createState() => _QueContainerState();
}

class _QueContainerState extends State<QueContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Text('${widget.index}.  ${widget.modeldetails.question}'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.value == true ? widget.modeldetails.ans : ''),
                    InkWell(

                        ///CHECKBOX
                        onTap: widget.action,
                        child: Container(
                          child: widget.value
                              ? Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                  child: const Icon(
                                    Icons.visibility_off,
                                    size: 25.0,
                                    color: Colors.white,
                                  ))
                              : Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange,
                                  ),
                                  padding: const EdgeInsets.all(0.0),
                                  child: const Icon(
                                    Icons.visibility,
                                    size: 25.0,
                                    color: Colors.white,
                                  ),
                                ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
