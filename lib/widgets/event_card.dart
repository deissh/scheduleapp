import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/dto/motd.dart';

class EventCard extends StatelessWidget {
  final Motd motd;

  EventCard(this.motd);

  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
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
                DateFormat('kk:mm dd/MM').format(this.motd.createdAt),
                style: TextStyle(
                  color: Color.fromRGBO(162,161,164,1)
                ),
              ),

              Text(this.motd.message),
              Spacer(),

              Row(children: <Widget>[
                Text(this.motd.type),
                Spacer(),
                Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: new Color(
                      int.parse("0x" + this.motd.typeColor.replaceFirst('#', ''))
                    ).withOpacity(1),
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
