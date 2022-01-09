import 'package:flutter/material.dart';
import 'package:quanlysvthuctap/views/ListSinhVien/ListInternship.dart';
import 'package:quanlysvthuctap/views/ListSinhVien/ListReport.dart';
import 'package:quanlysvthuctap/widgets/App/AppBar.dart';
import 'package:quanlysvthuctap/widgets/App/AppCardDetail.dart';
import 'package:quanlysvthuctap/widgets/App/MainDrawer.dart';

class WrapperList extends StatefulWidget {
  @override
  _WrapperListState createState() => _WrapperListState();
}

class _WrapperListState extends State<WrapperList>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(
        title: "QUẢN LÝ KHÁCH HÀNG",
        menuenabled: true,
        notificationenabled: true,
        ontap: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      drawer: Drawer(
        elevation: 0,
        child: MainDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppCardDetail(),
            DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black26,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(text: 'Danh sách khách hàng'),
                          Tab(text: ''),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.68, //height of TabBarView
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        ListInternship(),
                        ListReport(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
