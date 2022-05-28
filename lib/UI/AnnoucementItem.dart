import 'package:final_project4/Model/Announcement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnnoucementItem extends StatefulWidget {
  Announcement ann;
  Function reRun;

  AnnoucementItem(this.ann, this.reRun);

  @override
  State<AnnoucementItem> createState() => _AnnoucementItemState();
}

class _AnnoucementItemState extends State<AnnoucementItem> {
  @override
  Widget build(BuildContext context) {
    Icon fav_icon = Icon(
      Icons.favorite,
      color: Colors.pink,
    );
    if (this.widget.ann.is_fav == 2) {
      fav_icon = Icon(
        Icons.favorite,
        color: Colors.black,
      );
    }

    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.ann.image),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 60,
                  width: 120,
                  child: Text(
                    widget.ann.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Container(
                  height: 60,
                  width: 120,
                  child: Text(
                    widget.ann.user_id,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: fav_icon,
                onPressed: () {
                  if (this.widget.ann.is_fav == 1) {
                    this.widget.ann.is_fav = 2;
                    fav_icon = Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    );
                    ;
                  } else {
                    this.widget.ann.is_fav = 1;
                  }
                  setState(() {});
                  widget.reRun();
                },
              ),
              IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {
                  setState(() {});
                  widget.reRun();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
