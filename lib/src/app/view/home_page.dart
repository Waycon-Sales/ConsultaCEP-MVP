// ignore_for_file: prefer_const_constructors

import 'package:estudo_soap_flutter/src/app/control/consult_zipcode_control.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final consultControl = ConsultZipCodeControl();

  _start() {
    print("start");
    return Container(
      height: 10,
    );
  }

  _loading() {
    print("loading");
    return Center(child: CircularProgressIndicator());
  }

  _error() {
    print("error");
    return Text("Algo deu errado :(");
  }

  _setManagerState(CallStates state, context) {
    switch (state) {
      case CallStates.start:
        return _start();

      case CallStates.loading:
        return _loading();

      case CallStates.error:
        return _error();

      default:
        return _start();
    }
  }

  TextEditingController cep = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.orangeAccent,
          width: widthScreen,
          height: heightScreen,
          child: Padding(
            padding: EdgeInsets.only(
                left: widthScreen * 0.03, right: widthScreen * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: widthScreen * 0.04, right: widthScreen * 0.04),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        TextField(
                          controller: cep,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("CEP"),
                          ),
                          inputFormatters: [maskFormatter],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: widthScreen,
                          height: 45,
                          child: ElevatedButton(
                              onPressed: () {
                                consultControl.startConsult(
                                    cep.text.toString(), context);
                              },
                              child: Text("Buscar Endereço")),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          child: Center(
                            child: AnimatedBuilder(
                                animation: consultControl.state,
                                builder: (context, child) {
                                  return _setManagerState(
                                      consultControl.state.value, context);
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
