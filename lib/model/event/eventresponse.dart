class Event {
  bool status;
  int code;
  List<Data> data;

  Event({this.status, this.code, this.data});

  
  Event.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String iDEVENT;
  String tITTLE;
  String cONTENT;
  String iMAGE;
  String lOKASI;
  String iDWARGA;
  String tANGGAL;
  String cREATED;
  String mODIFIED;
  String publish;
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
  String pASSWORD;
  String fOTO;
  String sTATUS;
  String kETERANGAN;

  Data(
      {this.iDEVENT,
      this.tITTLE,
      this.cONTENT,
      this.iMAGE,
      this.lOKASI,
      this.iDWARGA,
      this.tANGGAL,
      this.cREATED,
      this.mODIFIED,
      this.publish,
      this.nIKWARGA,
      this.nAMAWARGA,
      this.jENISKELAMIN,
      this.nOTELP,
      this.eMAIL,
      this.tANGGALLAHIR,
      this.iDPENDIDIKAN,
      this.iDAGAMA,
      this.iDPEKERJAAN,
      this.iDRT,
      this.pASSWORD,
      this.fOTO,
      this.sTATUS,
      this.kETERANGAN});

  Data.fromJson(Map<String, dynamic> json) {
    iDEVENT = json['ID_EVENT'];
    tITTLE = json['TITTLE'];
    cONTENT = json['CONTENT'];
    iMAGE = json['IMAGE'];
    lOKASI = json['LOKASI'];
    iDWARGA = json['ID_WARGA'];
    tANGGAL = json['TANGGAL'];
    cREATED = json['CREATED'];
    mODIFIED = json['MODIFIED'];
    publish = json['Publish'];
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
    pASSWORD = json['PASSWORD'];
    fOTO = json['FOTO'];
    sTATUS = json['STATUS'];
    kETERANGAN = json['KETERANGAN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_EVENT'] = this.iDEVENT;
    data['TITTLE'] = this.tITTLE;
    data['CONTENT'] = this.cONTENT;
    data['IMAGE'] = this.iMAGE;
    data['LOKASI'] = this.lOKASI;
    data['ID_WARGA'] = this.iDWARGA;
    data['TANGGAL'] = this.tANGGAL;
    data['CREATED'] = this.cREATED;
    data['MODIFIED'] = this.mODIFIED;
    data['Publish'] = this.publish;
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
    data['PASSWORD'] = this.pASSWORD;
    data['FOTO'] = this.fOTO;
    data['STATUS'] = this.sTATUS;
    data['KETERANGAN'] = this.kETERANGAN;
    return data;
  }
}

