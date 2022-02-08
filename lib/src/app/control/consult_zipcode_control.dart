import 'package:estudo_soap_flutter/src/app/control/service/correios_service.dart';
import 'package:estudo_soap_flutter/src/app/model/data_consult.dart';
import 'package:flutter/cupertino.dart';

class ConsultZipCodeControl {
  DataConsult? data;
  final state = ValueNotifier<CallStates>(CallStates.start);

  Future startConsult(String cep, context) async {
    state.value = CallStates.loading;
    try {
      data = await CorreiosService().callConsultZipCode(cep);
      Navigator.of(context).pushNamed(
        "/Address",
        arguments: data,
      );
      state.value = CallStates.sucess;
    } catch (e) {
      state.value = CallStates.error;
    }
  }
}

enum CallStates { start, loading, sucess, error }
