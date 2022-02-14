import 'package:estudo_soap_flutter/src/app/service/correios_service.dart';
import 'package:estudo_soap_flutter/src/app/model/data_consult.dart';
import 'package:flutter/cupertino.dart';

abstract class ZipCodeContract {
  idle() {}
  loading() {}
  error() {}
  sucess() {}
  void changeCheckField() {}
}

class ConsultZipCodePresenter {
  DataConsult? data;
  final ZipCodeContract zipCodeContract;
  final state = ValueNotifier<CallStates>(CallStates.start);
  TextEditingController cepField = TextEditingController();
  bool isValid = true;
  String error = "";

  ConsultZipCodePresenter(this.zipCodeContract);

  Future startConsult() async {
    if (cepField.text.toString() != null &&
        cepField.text.toString() != "" &&
        cepField.text.toString().length < 10) {
      state.value = CallStates.loading;
      print(state.value);
      try {
        data = await CorreiosService()
            .callConsultZipCode(cepField.text.toString());
        zipCodeContract.sucess();
        state.value = CallStates.sucess;
        print(state.value);
      } catch (e) {
        error = e.toString();
        state.value = CallStates.error;
        print(state.value);
      }
    } else {
      isValid = false;
      zipCodeContract.changeCheckField();
      print("false");
    }
  }

  setManagerState(CallStates state) {
    switch (state) {
      case CallStates.start:
        return zipCodeContract.idle();

      case CallStates.loading:
        return zipCodeContract.loading();

      case CallStates.error:
        return zipCodeContract.error();
      case CallStates.sucess:
        return zipCodeContract.idle();
    }
  }
}

enum CallStates { start, loading, sucess, error }
