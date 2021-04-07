import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final void Function() onTap;

  DrawerItem({this.title, this.leadingIcon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(leadingIcon, size: 27, color: Colors.white,),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
    );
  }
}
