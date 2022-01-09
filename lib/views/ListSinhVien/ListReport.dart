import 'package:flutter/material.dart';
import 'package:quanlysvthuctap/widgets/SinhVien/CartLSPBN.dart';

class ListReport extends StatefulWidget {
  @override
  _ListReportState createState() => _ListReportState();
}

class _ListReportState extends State<ListReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CardReport(
            date: "02.01.2022",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "26.12.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "19.12.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "12.12.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "05.12.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "28.11.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "21.11.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "13.11.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "05.12.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "28.11.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
          CardReport(
            date: "21.11.2021",
            day: "sunday",
            firsthalf: true,
            secondhalf: false,
          ),
        ],
      ),
    );
  }
}
