import 'package:flutter/material.dart';

import '../constants.dart';
import 'AnnoucementItem.dart';

class FavoriteAnnoucement extends StatefulWidget {
  @override
  State<FavoriteAnnoucement> createState() => _FavoriteAnnoucementState();
}

class _FavoriteAnnoucementState extends State<FavoriteAnnoucement> {
  reRun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
          children: announcements_list
              .where((element) => element.is_fav == 1)
              .map((e) => AnnoucementItem(e, reRun))
              .toList()),
    ));
  }
}
