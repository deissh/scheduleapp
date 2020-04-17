
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/dto/week.dart';

class ScheduleItem extends StatelessWidget {
  final WeekDto item;

  ScheduleItem(this.item);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2.5),
      child: Row(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: new Color(
                int.parse("0x" + "44bdff") // todo: replace
              ).withOpacity(1),
              borderRadius: BorderRadius.circular(5)
            ),
            width: 5.0,
            height: 120,
          ),

          Flexible(
            child: Container(
              height: 120,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("08:30", style: TextStyle(color: Colors.grey)),

                  Spacer(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Основы Объектно-ориентированного программирования",
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Преподователь"),
                      Text("кб. 203"),
                    ]
                  ),

                  Spacer(),

                  Text("10:05", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
