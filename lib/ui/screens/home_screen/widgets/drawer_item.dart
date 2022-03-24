import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  final IconData leadingIcon;
  final String title;
  final void Function() onTap;

  DrawerItem({required this.title, required this.leadingIcon, required this.onTap});

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      leading: Icon(widget.leadingIcon, size: 27, color: Colors.white,),
      title: Text(widget.title, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
    );
  }
}
