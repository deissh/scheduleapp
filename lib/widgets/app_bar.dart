import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title = "";
  double height = 140.0;

  CustomAppBar({ Key key, this.title}) {
    if (title == null) height = 80;
  }

  @override
  Size get preferredSize => Size.fromHeight(this.height);

  Widget getTitle(BuildContext context) {
    return this.title != null ? Row(
      children: <Widget>[
        Text(
          this.title,
          style: Theme.of(context)
            .textTheme
            .display1
            .apply(
              color: Colors.black,
              fontWeightDelta: 1,
            )
        )
      ],
    ) : Row();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage("https://301222.selcdn.ru/akasi/avatars/1.png"),
                    width: 50,
                  ),
                )
              ],
            ),

            Spacer(),

            getTitle(context),
          ],
        ),
      ),
    );
  }
}
