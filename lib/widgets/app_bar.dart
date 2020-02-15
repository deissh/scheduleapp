import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title = "";
  double height = 140.0;

  CustomAppBar({ Key key, this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(this.height);

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
                      image: NetworkImage("https://avatars1.githubusercontent.com/u/21129524?s=460&v=4"),
                      width: 50,
                    ),
                  )
              ],
            ),

            Spacer(),

            Row(
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
            ),
          ],
        ),
      ),
    );
  }
}