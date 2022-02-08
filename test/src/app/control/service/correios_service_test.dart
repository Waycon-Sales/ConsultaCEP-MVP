/*import 'package:estudo_soap_flutter/src/app/control/service/correios_service.dart';
import 'package:estudo_soap_flutter/src/app/model/consult_zipcode_model.dart';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:xml2json/xml2json.dart';

void main() {
  final convertXml = Xml2Json();
  String cep = "60334-120";
  final service = CorreiosService(cep);
  ConsultZipCodeModel consultFromJson(String str) =>
      ConsultZipCodeModel.fromJson(json.decode(str));

  test("Teste request e response do cep", () async {
    final consult = await service.callCorreiosRastreamento();
    print(consult.bairro);
  });
}*/
