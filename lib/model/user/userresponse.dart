class UserResponse {
  bool status;
  int code;
  User data;
  String message;

  UserResponse({this.status, this.code, this.data, this.message});

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class User {
  String nIKWARGA;
  String nAMAWARGA;
  String jENISKELAMIN;
  String nOTELP;
  String eMAIL;
  String tANGGALLAHIR;
  String iDPENDIDIKAN;
  String iDAGAMA;
  String iDPEKERJAAN;
  String iDRT;
  String fOTO;
  String sTATUS;
  String kETERANGAN;
  String iDRW;
  String rT;
  String iDKELURAHAN;
  String rW;
  String iDKECAMATAN;
  String kELURAHAN;
  String kECAMATAN;
  String iDKABUPATEN;
  String aGAMA;
  String pEKERJAAN;
  String pENDIDIKAN;

  User(
      {this.nIKWARGA,
        this.nAMAWARGA,
        this.jENISKELAMIN,
        this.nOTELP,
        this.eMAIL,
        this.tANGGALLAHIR,
        this.iDPENDIDIKAN,
        this.iDAGAMA,
        this.iDPEKERJAAN,
        this.iDRT,
        this.fOTO,
        this.sTATUS,
        this.kETERANGAN,
        this.iDRW,
        this.rT,
        this.iDKELURAHAN,
        this.rW,
        this.iDKECAMATAN,
        this.kELURAHAN,
        this.kECAMATAN,
        this.iDKABUPATEN,
        this.aGAMA,
        this.pEKERJAAN,
        this.pENDIDIKAN});

  User.fromJson(Map<String, dynamic> json) {
    nIKWARGA = json['NIK_WARGA'];
    nAMAWARGA = json['NAMA_WARGA'];
    jENISKELAMIN = json['JENIS_KELAMIN'];
    nOTELP = json['NO_TELP'];
    eMAIL = json['EMAIL'];
    tANGGALLAHIR = json['TANGGAL_LAHIR'];
    iDPENDIDIKAN = json['ID_PENDIDIKAN'];
    iDAGAMA = json['ID_AGAMA'];
    iDPEKERJAAN = json['ID_PEKERJAAN'];
    iDRT = json['ID_RT'];
    fOTO = json['FOTO'];
    sTATUS = json['STATUS'];
    kETERANGAN = json['KETERANGAN'];
    iDRW = json['ID_RW'];
    rT = json['RT'];
    iDKELURAHAN = json['ID_KELURAHAN'];
    rW = json['RW'];
    iDKECAMATAN = json['ID_KECAMATAN'];
    kELURAHAN = json['KELURAHAN'];
    kECAMATAN = json['KECAMATAN'];
    iDKABUPATEN = json['ID_KABUPATEN'];
    aGAMA = json['AGAMA'];
    pEKERJAAN = json['PEKERJAAN'];
    pENDIDIKAN = json['PENDIDIKAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NIK_WARGA'] = this.nIKWARGA;
    data['NAMA_WARGA'] = this.nAMAWARGA;
    data['JENIS_KELAMIN'] = this.jENISKELAMIN;
    data['NO_TELP'] = this.nOTELP;
    data['EMAIL'] = this.eMAIL;
    data['TANGGAL_LAHIR'] = this.tANGGALLAHIR;
    data['ID_PENDIDIKAN'] = this.iDPENDIDIKAN;
    data['ID_AGAMA'] = this.iDAGAMA;
    data['ID_PEKERJAAN'] = this.iDPEKERJAAN;
    data['ID_RT'] = this.iDRT;
    data['FOTO'] = this.fOTO;
    data['STATUS'] = this.sTATUS;
    data['KETERANGAN'] = this.kETERANGAN;
    data['ID_RW'] = this.iDRW;
    data['RT'] = this.rT;
    data['ID_KELURAHAN'] = this.iDKELURAHAN;
    data['RW'] = this.rW;
    data['ID_KECAMATAN'] = this.iDKECAMATAN;
    data['KELURAHAN'] = this.kELURAHAN;
    data['KECAMATAN'] = this.kECAMATAN;
    data['ID_KABUPATEN'] = this.iDKABUPATEN;
    data['AGAMA'] = this.aGAMA;
    data['PEKERJAAN'] = this.pEKERJAAN;
    data['PENDIDIKAN'] = this.pENDIDIKAN;
    return data;
  }
}