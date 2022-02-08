class ConsultZipCodeModel {
  SoapEnvelope? soapEnvelope;

  ConsultZipCodeModel({this.soapEnvelope});

  ConsultZipCodeModel.fromJson(Map<String, dynamic> json) {
    soapEnvelope = json['soap:Envelope'] != null
        ? new SoapEnvelope.fromJson(json['soap:Envelope'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.soapEnvelope != null) {
      data['soap:Envelope'] = this.soapEnvelope!.toJson();
    }
    return data;
  }
}

class SoapEnvelope {
  SoapBody? soapBody;

  SoapEnvelope({this.soapBody});

  SoapEnvelope.fromJson(Map<String, dynamic> json) {
    soapBody = json['soap:Body'] != null
        ? new SoapBody.fromJson(json['soap:Body'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.soapBody != null) {
      data['soap:Body'] = this.soapBody!.toJson();
    }
    return data;
  }
}

class SoapBody {
  Ns2ConsultaCEPResponse? ns2ConsultaCEPResponse;

  SoapBody({this.ns2ConsultaCEPResponse});

  SoapBody.fromJson(Map<String, dynamic> json) {
    ns2ConsultaCEPResponse = json['ns2:consultaCEPResponse'] != null
        ? new Ns2ConsultaCEPResponse.fromJson(json['ns2:consultaCEPResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ns2ConsultaCEPResponse != null) {
      data['ns2:consultaCEPResponse'] = this.ns2ConsultaCEPResponse!.toJson();
    }
    return data;
  }
}

class Ns2ConsultaCEPResponse {
  ReturnData? returnData;

  Ns2ConsultaCEPResponse({this.returnData});

  Ns2ConsultaCEPResponse.fromJson(Map<String, dynamic> json) {
    returnData =
        json['return'] != null ? new ReturnData.fromJson(json['return']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.returnData != null) {
      data['return'] = this.returnData!.toJson();
    }
    return data;
  }
}

class ReturnData {
  String? bairro;
  String? cep;
  String? cidade;
  String? complemento2;
  String? end;
  String? uf;

  ReturnData(
      {this.bairro,
      this.cep,
      this.cidade,
      this.complemento2,
      this.end,
      this.uf});

  ReturnData.fromJson(Map<String, dynamic> json) {
    bairro = json['bairro'];
    cep = json['cep'];
    cidade = json['cidade'];
    complemento2 = json['complemento2'];
    end = json['end'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bairro'] = this.bairro;
    data['cep'] = this.cep;
    data['cidade'] = this.cidade;
    data['complemento2'] = this.complemento2;
    data['end'] = this.end;
    data['uf'] = this.uf;
    return data;
  }
}
