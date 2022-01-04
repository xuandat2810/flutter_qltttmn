class TreEm {
  String maTreEm;
  String tenTreEm;
  String lopHoc;
  String giaoVien;
  String sdtPhuHuynh;
  bool status;

  // Classroom lopHocPhan;

  set setMaSinhVien(String value) {
    maTreEm = value;
  }

  set setTenSinhVien(String value) {
    tenTreEm = value;
  }

  set setChuyenNganh(String value) {
    lopHoc = value;
  }

  set setGiangVien(String value) {
    giaoVien = value;
  }

  set setNoiThucTap(String value) {
    sdtPhuHuynh = value;
  }

  set setStatus(bool value) {
    status = value;
  }

  TreEm(this.maTreEm, this.tenTreEm, this.lopHoc,
      this.giaoVien, this.sdtPhuHuynh,
      [this.status = true]);

  TreEm.cloneByObject(TreEm s) {
    this.maTreEm = s.maTreEm;
    this.tenTreEm = s.tenTreEm;
    this.lopHoc = s.lopHoc;
    this.giaoVien = s.giaoVien;
    this.sdtPhuHuynh = s.sdtPhuHuynh;
  }
}
