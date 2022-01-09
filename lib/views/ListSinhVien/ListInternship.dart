import 'package:flutter/material.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/pandabar.dart';
import 'package:quanlysvthuctap/data/Data.dart';
import 'package:quanlysvthuctap/views/ChiTietSinhVien/ThemOrCapNhatSinhVien.dart';
import 'package:quanlysvthuctap/widgets/SinhVien/CardSinhVien.dart';

class ListInternship extends StatefulWidget {
  @override
  _ListInternshipState createState() => _ListInternshipState();
}

class _ListInternshipState extends State<ListInternship> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: sinhVien.length,
        padding: EdgeInsets.only(bottom: 20),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: CardStudent(
                student: sinhVien[index],
                listView: sinhVien,
                index: index,
                setState: setState),
          );
        },
      ),
      bottomNavigationBar: PandaBar(
        buttonData: [
          PandaBarButtonData(id: 'Home', icon: Icons.dashboard, title: 'Home'),
          PandaBarButtonData(
              id: 'Search', icon: Icons.person_search_rounded, title: 'Search'),
          PandaBarButtonData(
              id: 'Setting', icon: Icons.build_rounded, title: 'Setting'),
          PandaBarButtonData(
              id: 'Profile', icon: Icons.assignment_ind, title: 'Profile'),
        ],
        onChange: (id) {
          setState(
            () {
              // page = id;
            },
          );
        },
        onFabButtonPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ThemOrCapNhat(),
            ),
          );
        },
      ),
    );
  }
}
