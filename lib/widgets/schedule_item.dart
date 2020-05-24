
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/dto/week_schedule.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule item;

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
                int.parse(item.typeColor) // todo: replace
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
                        item.name,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(item.lecturer),
                      Text(item.location),
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
