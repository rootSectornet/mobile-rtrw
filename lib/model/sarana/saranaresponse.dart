class SaranaResponse {
  bool status;
  int code;
  List<JenisSarana> jenisSarana;

  SaranaResponse({this.status, this.code, this.jenisSarana});

  SaranaResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      jenisSarana = new List<JenisSarana>();
      json['data'].forEach((v) {
        jenisSarana.add(new JenisSarana.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.jenisSarana != null) {
      data['data'] = this.jenisSarana.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JenisSarana {
  String iDJENISSARANA;
  String jENISSARANA;
  String aCTIVE;
  List<Sarana> sarana;
  int total;

  JenisSarana(
      {this.iDJENISSARANA,
        this.jENISSARANA,
        this.aCTIVE,
        this.sarana,
        this.total});

  JenisSarana.fromJson(Map<String, dynamic> json) {
    iDJENISSARANA = json['ID_JENIS_SARANA'];
    jENISSARANA = json['JENIS_SARANA'];
    aCTIVE = json['ACTIVE'];
    if (json['Sarana'] != null) {
      sarana = new List<Sarana>();
      json['Sarana'].forEach((v) {
        sarana.add(new Sarana.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_JENIS_SARANA'] = this.iDJENISSARANA;
    data['JENIS_SARANA'] = this.jENISSARANA;
    data['ACTIVE'] = this.aCTIVE;
    if (this.sarana != null) {
      data['Sarana'] = this.sarana.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Sarana {
  String iDSARANA;
  String nAMASARANA;
  String iDJENISSARANA;
  String iDRTRW;
  String fLAG;
  String iSPRIVATE;
  String dETAIL;
  String cREATED;
  String mODIFIED;
  String jENISSARANA;
  String wILAYAH;

  Sarana(
      {this.iDSARANA,
        this.nAMASARANA,
        this.iDJENISSARANA,
        this.iDRTRW,
        this.fLAG,
        this.iSPRIVATE,
        this.dETAIL,
        this.cREATED,
        this.mODIFIED,
        this.jENISSARANA,
        this.wILAYAH});

  Sarana.fromJson(Map<String, dynamic> json) {
    iDSARANA = json['ID_SARANA'];
    nAMASARANA = json['NAMA_SARANA'];
    iDJENISSARANA = json['ID_JENIS_SARANA'];
    iDRTRW = json['ID_RTRW'];
    fLAG = json['FLAG'];
    iSPRIVATE = json['ISPRIVATE'];
    dETAIL = json['DETAIL'];
    cREATED = json['CREATED'];
    mODIFIED = json['MODIFIED'];
    jENISSARANA = json['JENIS_SARANA'];
    wILAYAH = json['WILAYAH'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_SARANA'] = this.iDSARANA;
    data['NAMA_SARANA'] = this.nAMASARANA;
    data['ID_JENIS_SARANA'] = this.iDJENISSARANA;
    data['ID_RTRW'] = this.iDRTRW;
    data['FLAG'] = this.fLAG;
    data['ISPRIVATE'] = this.iSPRIVATE;
    data['DETAIL'] = this.dETAIL;
    data['CREATED'] = this.cREATED;
    data['MODIFIED'] = this.mODIFIED;
    data['JENIS_SARANA'] = this.jENISSARANA;
    data['WILAYAH'] = this.wILAYAH;
    return data;
  }
}
