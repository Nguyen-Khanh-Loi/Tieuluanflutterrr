import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:quanlysvthuctap/data/Data.dart';
import 'package:quanlysvthuctap/models/SinhVien.dart';
import 'package:quanlysvthuctap/views/ListSinhVien/WrapperList.dart';
import 'package:quanlysvthuctap/widgets/App/AppBar.dart';
import 'package:quanlysvthuctap/widgets/App/BouncingButton.dart';
import 'package:quanlysvthuctap/widgets/App/MainDrawer.dart';

class ThemOrCapNhat extends StatefulWidget {
  final SinhVien sinhvien;
  final List<SinhVien> listView;
  final int index;
  final Function(VoidCallback fn) setStateView;

  const ThemOrCapNhat(
      {Key key, this.sinhvien, this.listView, this.index, this.setStateView})
      : super(key: key);

  @override
  _ThemOrCapNhatState createState() => _ThemOrCapNhatState();
}

class _ThemOrCapNhatState extends State<ThemOrCapNhat>
    with SingleTickerProviderStateMixin {
  String conLop, conGiaoVien;
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;

  SinhVien student;

  TextEditingController conMaSinhVien = TextEditingController();
  TextEditingController conTenSinhVien = TextEditingController();
  TextEditingController conSdtPhuHuynh = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    student = widget.sinhvien;

    conMaSinhVien.text = student?.maSinhVien;
    conTenSinhVien.text = student?.tenSinhVien;

    conLop = student?.lopHoc;
    conSdtPhuHuynh.text = student?.sdt;
    conGiaoVien = student?.CongTy;

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    conMaSinhVien.dispose();
    conTenSinhVien.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        final GlobalKey<ScaffoldState> _scaffoldKey =
            new GlobalKey<ScaffoldState>();
        return Scaffold(
          key: _scaffoldKey,
          appBar: CommonAppBar(
            menuenabled: true,
            notificationenabled: false,
            title: widget.sinhvien != null
                ? "Cập nhật khách hàng"
                : "Thêm mới khách hàng",
            ontap: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          drawer: Drawer(
            elevation: 0,
            child: MainDrawer(),
          ),
          body: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Mã khách hàng *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 13,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập mã khách hàng';
                              }
                              return null;
                            },
                            controller: conMaSinhVien,
                            minLines: 1,
                            autofocus: false,
                            decoration: const InputDecoration(
                              hintText: 'Nhập vào mã khách hàng',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Họ tên *",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 13,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            controller: conTenSinhVien,
                            minLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập họ tên';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Nhập vào họ tên',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Địa chỉ",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: DropdownSearch<String>(
                        validator: (selectedValue) {
                          if (selectedValue == null) {
                            return 'Chọn địa chỉ';
                          }
                          return null;
                        },
                        showClearButton: true,
                        mode: Mode.MENU,
                        items: lop.map((e) => e.tenLop).toList(),
                        onChanged: (String item) => {
                          setState(() {
                            conLop = item;
                          }),
                        },
                        selectedItem: widget.sinhvien != null
                            ? widget.sinhvien.lopHoc
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "CMND",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: DropdownSearch<String>(
                        validator: (String item) {
                          if (item.isEmpty)
                            return "Required field";
                          else
                            return null; //return null to "no error"
                        },
                        showSearchBox: true,
                        showClearButton: true,
                        mode: Mode.MENU,
                        items: giaoVien.map((e) => e.tenGiaoVien).toList(),
                        onChanged: (String item) => {
                          setState(() {
                            conGiaoVien = item;
                          }),
                        },
                        selectedItem: widget.sinhvien != null
                            ? widget.sinhvien.CongTy
                            : null,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Số điện thoại *",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 13,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            controller: conSdtPhuHuynh,
                            minLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập số điện thoại';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Nhập số điện thoại',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: BouncingButton(
                        onPress: () {
                          if (_formkey.currentState.validate()) {
                            final maTreEm = conMaSinhVien.text;
                            final tenTreEm = conTenSinhVien.text;
                            final lopHoc = conLop;
                            final giaoVien = conGiaoVien;
                            final sdtPhuHuynh = conSdtPhuHuynh.text;

                            SinhVien newStudent = new SinhVien(
                                maTreEm,
                                tenTreEm,
                                lopHoc,
                                giaoVien,
                                sdtPhuHuynh);

                            if (widget.setStateView == null) {
                              sinhVien.add(newStudent);
                            } else {
                              widget.setStateView(() {
                                widget.listView[widget.index].setMaSinhVien =
                                    newStudent.maSinhVien;
                                widget.listView[widget.index].setTenSinhVien =
                                    newStudent.tenSinhVien;
                                widget.listView[widget.index].setNoiThucTap =
                                    newStudent.sdt;
                                widget.listView[widget.index].setChuyenNganh =
                                    newStudent.lopHoc;
                                widget.listView[widget.index].setGiangVien =
                                    newStudent.CongTy;
                              });
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WrapperList(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: widget.sinhvien != null
                                  ? Text(
                                      "Cập nhật",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Thêm mới",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
