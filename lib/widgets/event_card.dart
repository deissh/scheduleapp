import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventCard extends StatelessWidget {
  final DateTime timestamp;
  final String body;
  final String type;
  final Color typeColor;

  EventCard(this.timestamp, this.body, this.type, this.typeColor);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(
                DateFormat('hh:mm dd/mm').format(this.timestamp),
                style: TextStyle(
                  color: Color.fromRGBO(162,161,164,1)
                ),
              ),

              Text("very long message of the day"),
              Spacer(),

              Row(children: <Widget>[
                Text(this.type),
                Spacer(),
                Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: this.typeColor
                  ),
                  width: 10.0,
                  height: 10.0,
                ),
              ])
            ],
          )
        ),
      ),
    );
  }

}
