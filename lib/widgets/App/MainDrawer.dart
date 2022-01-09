import 'package:flutter/material.dart';
import 'package:quanlysvthuctap/data/Data.dart';
import 'package:quanlysvthuctap/views/ListSinhVien/WrapperList.dart';
import 'package:quanlysvthuctap/widgets/App/DrawerListTile.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: departments.map((e) {
        return DrawerListTile(
          name: e.tenCapBac,
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => WrapperList(),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
