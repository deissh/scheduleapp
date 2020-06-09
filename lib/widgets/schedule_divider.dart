import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/dto/week_schedule.dart';

class ScheduleDivider extends StatelessWidget {
  final Schedule item;

  ScheduleDivider(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: new Color(
                int.parse(item.typeColor) // todo: replace
              ).withOpacity(1),
            ),
            width: 10.0,
            height: 10.0,
          ),

          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.startAt + " — " + item.endAt,
                    style: TextStyle(color: Colors.grey)
                  ),

                  Text(
                    item.name,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
