// ignore_for_file: prefer_const_constructors

import 'package:estudo_soap_flutter/src/app/presenter/consult_zipcode_presenter.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements ZipCodeContract {
  late ConsultZipCodePresenter consultPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    consultPresenter = ConsultZipCodePresenter(this);
  }

  @override
  idle() {
    return Container(
      height: 10,
    );
  }

  @override
  loading() {
    return Center(child: CircularProgressIndicator());
  }

  @override
  error() {
    print("erro");
    return Text(
      "Algo deu errado :(.\n\nTente novamente! :D",
      textAlign: TextAlign.center,
    );
  }

  @override
  sucess() {
    return Navigator.of(context).pushNamed(
      "/Address",
      arguments: consultPresenter.data,
    );
  }

  @override
  void changeCheckField() {
    setState(() {});
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  var isStart = false;

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
                          onChanged: (value) {
                            setState(() {
                              consultPresenter.isValid = true;
                            });
                          },
                          controller: consultPresenter.cepField,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            errorText: consultPresenter.isValid
                                ? null
                                : "Preencha o campo",
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
                              onPressed: () async {
                                await consultPresenter.startConsult();
                              },
                              child: Text("Buscar Endereço")),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: 200,
                            height: 60,
                            child: Center(
                              child: AnimatedBuilder(
                                  animation: consultPresenter.state,
                                  builder: (context, child) {
                                    return consultPresenter.setManagerState(
                                        consultPresenter.state.value);
                                  }),
                            )),
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
