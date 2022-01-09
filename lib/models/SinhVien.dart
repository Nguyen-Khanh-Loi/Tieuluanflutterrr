class SinhVien {
  String maSinhVien;
  String tenSinhVien;
  String lopHoc;
  String CongTy;
  String sdt;
  bool status;

  // Classroom lopHocPhan;

  set setMaSinhVien(String value) {
    maSinhVien = value;
  }

  set setTenSinhVien(String value) {
    tenSinhVien= value;
  }

  set setChuyenNganh(String value) {
    lopHoc = value;
  }

  set setGiangVien(String value) {
    CongTy = value;
  }

  set setNoiThucTap(String value) {
    sdt = value;
  }

  set setStatus(bool value) {
    status = value;
  }

  SinhVien(this.maSinhVien, this.tenSinhVien, this.lopHoc,
      this.CongTy, this.sdt,
      [this.status = true]);

  SinhVien.cloneByObject(SinhVien s) {
    this.maSinhVien = s.maSinhVien;
    this.tenSinhVien = s.tenSinhVien;
    this.lopHoc = s.lopHoc;
    this.CongTy = s.CongTy;
    this.sdt = s.sdt;
  }
}
