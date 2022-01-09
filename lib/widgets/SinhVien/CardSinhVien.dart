import 'package:flutter/material.dart';
import 'package:quanlysvthuctap/models/SinhVien.dart';
import 'package:quanlysvthuctap/views/ChiTietSinhVien/ThemOrCapNhatSinhVien.dart';
import 'package:quanlysvthuctap/views/ChiTietSinhVien/ChiTietSinhVien.dart';

class CardStudent extends StatefulWidget {
  final SinhVien student;
  final List<SinhVien> listView;
  final int index;
  final Function(VoidCallback fn) setState;

  const CardStudent(
      {Key key, this.student, this.listView, this.index, this.setState})
      : super(key: key);

  @override
  _CardStudentState createState() => _CardStudentState();
}

class _CardStudentState extends State<CardStudent>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 0.7, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(2),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Transform(
                transform: Matrix4.translationValues(
                    delayedAnimation.value * width, 0, 0),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        //blurRadius: 3,
                        //spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.student.tenSinhVien}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Lớp " + "${widget.student.lopHoc}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 60,
                            child: Center(
                              child: SizedBox.fromSize(
                                size: Size(46, 46), // button width and height
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.green,
                                    // button color
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      // splash color
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ThemOrCapNhat(
                                              sinhvien: widget.student,
                                              listView: widget.listView,
                                              index: widget.index,
                                              setStateView: widget.setState,
                                            ),
                                          ),
                                        );
                                      },
                                      // button pressed
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.create_outlined,
                                            size: 20,
                                          ),
                                          // icon
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Center(
                              child: SizedBox.fromSize(
                                size: Size(46, 46), // button width and height
                                child: ClipOval(
                                  child: Material(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(Colors
                                                .blueGrey), // button color
                                      ),
                                      onPressed: () {
                                        SinhVien tempTreEm =
                                            new SinhVien.cloneByObject(
                                                widget.student);
                                        widget.setState(() {
                                          widget.listView
                                              .removeAt(widget.index);
                                        });
                                        final snackBar = SnackBar(
                                          content:
                                              const Text('Đã xoá thành công'),
                                          action: SnackBarAction(
                                            label: 'Khôi phục',
                                            onPressed: () {
                                              widget.setState(() {
                                                widget.listView
                                                    .add(tempTreEm);
                                              });
                                            },
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.auto_delete_outlined,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentDetail(student: widget.student),
              ),
            );
          },
        );
      },
    );
  }
}
