import 'package:quanlysvthuctap/models/LopHoc.dart';
import 'package:quanlysvthuctap/models/CapBac.dart';
import 'package:quanlysvthuctap/models/Lop.dart';
import 'package:quanlysvthuctap/models/SinhVien.dart';
import 'package:quanlysvthuctap/models/GiaoVien.dart';

List<CapBac> departments = [
  CapBac('Khách hàng thường'),
  CapBac('Khách hàng thân thiết'),
  CapBac('Khách hàng vip'),
];

List<LopHoc> classes = [
  LopHoc('Quảng Trị', 10, departments[1],
      giaoVien[1]),
  LopHoc('Huế', 10, departments[1],
      giaoVien[2]),
  LopHoc('Sài Gòn', 10, departments[1],
      giaoVien[3]),
  LopHoc('Đà Nẵng', 10, departments[2],
      giaoVien[4]),
  LopHoc('Hà Nội', 10, departments[2],
      giaoVien[5]),
  LopHoc('Nha Trang', 10, departments[2],
      giaoVien[6]),
  LopHoc('Phan Thiết', 10, departments[3],
      giaoVien[7]),
  LopHoc('Bình Thuận', 10, departments[3],
      giaoVien[8]),
  LopHoc('Bình Dương', 10, departments[3],
      giaoVien[9]),
];

List<Lop> lop = [
  Lop('Quảng Trị', departments[1]),
  Lop('Quảng Bình', departments[1]),
  Lop('Huế', departments[1]),
  Lop('Đà Nẵng', departments[1]),
  Lop('Hồ Chí Minh', departments[1]),
  Lop('Nha Trang', departments[1]),
  Lop('Bình Thuận', departments[1]),
  Lop('Bình dương', departments[1]),
  Lop('Hà Nội', departments[1]),
];

List<GiaoVien> giaoVien = [
  GiaoVien("abc"),
  GiaoVien("abc"),
  GiaoVien(""),
  GiaoVien(""),
  GiaoVien(""),
  GiaoVien(""),
  GiaoVien(""),
  GiaoVien(""),
];

List<SinhVien> sinhVien = [
  SinhVien("KH1", "Nguyễn Văn A", "ABC",
      "ABC", "0123456789", true),
  SinhVien("18T00002", "Nguyễn Văn B", "BCD",
      "ABC", "0123456789", true),
  SinhVien("18T00003", "Nguyễn Văn C", "CVVV",
      "ABC", "0123456789", true),
  SinhVien("18T00004", "Nguyễn Văn A", "BNM",
      "CT FPT", "0123456789", true),
  SinhVien("18T00005", "Nguyễn Văn A", "BNHGh",
      "CT FPT", "0123456789", true),
];
