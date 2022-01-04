import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:quanlysvthuctap/data/Data.dart';
import 'package:quanlysvthuctap/models/TreEm.dart';
import 'package:quanlysvthuctap/views/ListTreEm/WrapperList.dart';
import 'package:quanlysvthuctap/widgets/App/AppBar.dart';
import 'package:quanlysvthuctap/widgets/App/BouncingButton.dart';
import 'package:quanlysvthuctap/widgets/App/MainDrawer.dart';

class ThemOrCapNhat extends StatefulWidget {
  final TreEm treEm;
  final List<TreEm> listView;
  final int index;
  final Function(VoidCallback fn) setStateView;

  const ThemOrCapNhat(
      {Key key, this.treEm, this.listView, this.index, this.setStateView})
      : super(key: key);

  @override
  _ThemOrCapNhatState createState() => _ThemOrCapNhatState();
}

class _ThemOrCapNhatState extends State<ThemOrCapNhat>
    with SingleTickerProviderStateMixin {
  String conLop, conGiaoVien;
  Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  AnimationController animationController;

  TreEm student;

  TextEditingController conMaTreEm = TextEditingController();
  TextEditingController conTenTreEm = TextEditingController();
  TextEditingController conSdtPhuHuynh = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    student = widget.treEm;

    conMaTreEm.text = student?.maTreEm;
    conTenTreEm.text = student?.tenTreEm;

    conLop = student?.lopHoc;
    conSdtPhuHuynh.text = student?.sdtPhuHuynh;
    conGiaoVien = student?.giaoVien;

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
    conMaTreEm.dispose();
    conTenTreEm.dispose();
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
            title: widget.treEm != null
                ? "Cập nhật bé"
                : "Thêm mới bé",
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
                        "Mã trẻ em *",
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
                                return 'Vui lòng nhập mã trẻ em';
                              }
                              return null;
                            },
                            controller: conMaTreEm,
                            minLines: 1,
                            autofocus: false,
                            decoration: const InputDecoration(
                              hintText: 'Nhập vào mã trẻ em',
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
                            controller: conTenTreEm,
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
                        "Lớp *",
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
                            return 'Vui lòng chọn lớp';
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
                        selectedItem: widget.treEm != null
                            ? widget.treEm.lopHoc
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
                        "Giáo viên mầm non *",
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
                        selectedItem: widget.treEm != null
                            ? widget.treEm.giaoVien
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
                        "Số điện thoại phụ huynh *",
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
                                return 'Vui lòng nhập số điện thoại phụ huynh';
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
                          delayedAnimation.value * width, 0, 0),
                      child: BouncingButton(
                        onPress: () {
                          if (_formkey.currentState.validate()) {
                            final maTreEm = conMaTreEm.text;
                            final tenTreEm = conTenTreEm.text;
                            final lopHoc = conLop;
                            final giaoVien = conGiaoVien;
                            final sdtPhuHuynh = conSdtPhuHuynh.text;

                            TreEm newStudent = new TreEm(
                                maTreEm,
                                tenTreEm,
                                lopHoc,
                                giaoVien,
                                sdtPhuHuynh);

                            if (widget.setStateView == null) {
                              treEm.add(newStudent);
                            } else {
                              widget.setStateView(() {
                                widget.listView[widget.index].setMaSinhVien =
                                    newStudent.maTreEm;
                                widget.listView[widget.index].setTenSinhVien =
                                    newStudent.tenTreEm;
                                widget.listView[widget.index].setNoiThucTap =
                                    newStudent.sdtPhuHuynh;
                                widget.listView[widget.index].setChuyenNganh =
                                    newStudent.lopHoc;
                                widget.listView[widget.index].setGiangVien =
                                    newStudent.giaoVien;
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
                              child: widget.treEm != null
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
