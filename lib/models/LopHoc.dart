

import 'package:quanlysvthuctap/models/CapBac.dart';
import 'package:quanlysvthuctap/models/GiaoVien.dart';

class LopHoc {
  String tenLop;
  CapBac khoa;
  GiaoVien giaoVien;
  int soLuong;

  LopHoc(this.tenLop, this.soLuong, this.khoa, this.giaoVien);
}
