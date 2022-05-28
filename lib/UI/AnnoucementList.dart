import 'package:final_project4/UI/AnnoucementItem.dart';
import 'package:final_project4/constants.dart';
import 'package:flutter/material.dart';

class AnnoucementList extends StatefulWidget {
  @override
  State<AnnoucementList> createState() => _AnnoucementListState();
}

class _AnnoucementListState extends State<AnnoucementList> {
  reRun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
          children: announcements_list
              .map((e) => AnnoucementItem(e, reRun))
              .toList()),
    ));
  }
}
