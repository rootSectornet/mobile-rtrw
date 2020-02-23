class History {
  bool status;
  int code;
  Data data;

  History({this.status, this.code, this.data});

  History.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Aduan> data;
  String total;

  Data({this.data, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Aduan>();
      json['data'].forEach((v) {
        data.add(new Aduan.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Aduan {
  String iDPENGADUAN;
  String iDJENISPENGADUAN;
  String iDWARGA;
  Null iDFASILITAS;
  String iDTUJUAN;
  String fLAG;
  String sTATUS;
  String tANGGAL;
  String cONTENT;
  Null tITLE;
  String cREATED;
  String mODIFIED;
  String jENISPENGADUAN;
  String aCTIVE;
  String tUJUAN;
  List<LAMPIRAN> lAMPIRAN;

  Aduan(
      {this.iDPENGADUAN,
        this.iDJENISPENGADUAN,
        this.iDWARGA,
        this.iDFASILITAS,
        this.iDTUJUAN,
        this.fLAG,
        this.sTATUS,
        this.tANGGAL,
        this.cONTENT,
        this.tITLE,
        this.cREATED,
        this.mODIFIED,
        this.jENISPENGADUAN,
        this.aCTIVE,
        this.tUJUAN,
        this.lAMPIRAN});

  Aduan.fromJson(Map<String, dynamic> json) {
    iDPENGADUAN = json['ID_PENGADUAN'];
    iDJENISPENGADUAN = json['ID_JENIS_PENGADUAN'];
    iDWARGA = json['ID_WARGA'];
    iDFASILITAS = json['ID_FASILITAS'];
    iDTUJUAN = json['ID_TUJUAN'];
    fLAG = json['FLAG'];
    sTATUS = json['STATUS'];
    tANGGAL = json['TANGGAL'];
    cONTENT = json['CONTENT'];
    tITLE = json['TITLE'];
    cREATED = json['CREATED'];
    mODIFIED = json['MODIFIED'];
    jENISPENGADUAN = json['JENIS_PENGADUAN'];
    aCTIVE = json['ACTIVE'];
    tUJUAN = json['TUJUAN'];
    if (json['LAMPIRAN'] != null) {
      lAMPIRAN = new List<LAMPIRAN>();
      json['LAMPIRAN'].forEach((v) {
        lAMPIRAN.add(new LAMPIRAN.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_PENGADUAN'] = this.iDPENGADUAN;
    data['ID_JENIS_PENGADUAN'] = this.iDJENISPENGADUAN;
    data['ID_WARGA'] = this.iDWARGA;
    data['ID_FASILITAS'] = this.iDFASILITAS;
    data['ID_TUJUAN'] = this.iDTUJUAN;
    data['FLAG'] = this.fLAG;
    data['STATUS'] = this.sTATUS;
    data['TANGGAL'] = this.tANGGAL;
    data['CONTENT'] = this.cONTENT;
    data['TITLE'] = this.tITLE;
    data['CREATED'] = this.cREATED;
    data['MODIFIED'] = this.mODIFIED;
    data['JENIS_PENGADUAN'] = this.jENISPENGADUAN;
    data['ACTIVE'] = this.aCTIVE;
    data['TUJUAN'] = this.tUJUAN;
    if (this.lAMPIRAN != null) {
      data['LAMPIRAN'] = this.lAMPIRAN.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LAMPIRAN {
  String iDLAMPIRAN;
  String lAMPIRAN;
  String iDRELASI;
  String fLAG;
  String uRL;
  String sIZE;
  String mIMETYPE;

  LAMPIRAN(
      {this.iDLAMPIRAN,
        this.lAMPIRAN,
        this.iDRELASI,
        this.fLAG,
        this.uRL,
        this.sIZE,
        this.mIMETYPE});

  LAMPIRAN.fromJson(Map<String, dynamic> json) {
    iDLAMPIRAN = json['ID_LAMPIRAN'];
    lAMPIRAN = json['LAMPIRAN'];
    iDRELASI = json['ID_RELASI'];
    fLAG = json['FLAG'];
    uRL = json['URL'];
    sIZE = "${json['SIZE']}";
    mIMETYPE = json['MIMETYPE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_LAMPIRAN'] = this.iDLAMPIRAN;
    data['LAMPIRAN'] = this.lAMPIRAN;
    data['ID_RELASI'] = this.iDRELASI;
    data['FLAG'] = this.fLAG;
    data['URL'] = this.uRL;
    data['SIZE'] = "${this.sIZE}";
    data['MIMETYPE'] = this.mIMETYPE;
    return data;
  }
}