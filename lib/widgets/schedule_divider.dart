import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScheduleDivider extends StatelessWidget {
  final String name;
  final String hexColor;
  final String startAt;
  final String endAt;

  ScheduleDivider(this.name, this.hexColor, this.startAt, this.endAt);

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
                int.parse("0x" + "9053c3") // todo: replace
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
                    startAt + " — " + endAt,
                    style: TextStyle(color: Colors.grey)
                  ),

                  Text(
                    name,
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
