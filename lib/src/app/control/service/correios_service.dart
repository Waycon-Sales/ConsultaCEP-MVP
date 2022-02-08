import 'package:estudo_soap_flutter/src/app/model/consult_zipcode_model.dart';
import 'package:estudo_soap_flutter/src/app/model/data_consult.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class CorreiosService {
  String resposta = "";
  final uri = Uri.parse(
      "https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente");

  final convertXml = Xml2Json();
  ConsultZipCodeModel consultFromJson(String str) =>
      ConsultZipCodeModel.fromJson(json.decode(str));

  Future<DataConsult> callConsultZipCode(String cep) async {
    String envelope =
        "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:cli=\"http://cliente.bean.master.sigep.bsb.correios.com.br/\">" +
            "   <soapenv:Body>" +
            "      <cli:consultaCEP>" +
            "         <cep>" +
            cep +
            "</cep>" +
            "      </cli:consultaCEP>" +
            "   </soap:Body>" +
            "</soap:Envelope>";

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "text/xml",
      },
      body: envelope,
    );

    convertXml.parse(response.body);
    var jsondata = convertXml.toParker();
    var consultData = consultFromJson(jsondata);
    DataConsult dataConsult = DataConsult(
        consultData
            .soapEnvelope?.soapBody!.ns2ConsultaCEPResponse!.returnData!.bairro,
        cep,
        consultData
            .soapEnvelope?.soapBody!.ns2ConsultaCEPResponse!.returnData!.cidade,
        consultData.soapEnvelope?.soapBody!.ns2ConsultaCEPResponse!.returnData!
            .complemento2,
        consultData
            .soapEnvelope?.soapBody!.ns2ConsultaCEPResponse!.returnData!.end,
        consultData
            .soapEnvelope?.soapBody!.ns2ConsultaCEPResponse!.returnData!.uf);
    return dataConsult;
  }
}
