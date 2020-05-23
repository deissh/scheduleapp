import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title = "";
  double height = 140.0;
  String avatar;
  VoidCallback onAvatarClick = () => {};

  CustomAppBar({ Key key, this.title, this.avatar, this.onAvatarClick}) {
    if (title == null) height = 80;
    if (avatar == null) avatar = "https://301222.selcdn.ru/akasi/avatars/1.png";
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
                GestureDetector(
                  onTap: onAvatarClick,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: avatar,
                      width: 50,
                      placeholder: (context, url) => new Image.asset('assets/fallback_avatar.png', width: 50,),
                      errorWidget: (context, url, error) => new Image.asset('assets/fallback_avatar.png', width: 50,),
                    ),
                  ),
                ),
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
