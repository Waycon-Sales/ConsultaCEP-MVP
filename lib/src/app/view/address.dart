import 'package:estudo_soap_flutter/src/app/model/data_consult.dart';
import 'package:estudo_soap_flutter/src/app/view/components/row_text.dart';
import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  @override
  State<Address> createState() => _AddressState();
  static const routeNane = "/Address";
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    final consult = ModalRoute.of(context)?.settings.arguments as DataConsult;
    String? complement = consult.complemento2;
    String titleComplement = "Complemento";
    if (complement == null) {
      complement = "";
      titleComplement = "";
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.orangeAccent,
          width: widthScreen,
          height: heightScreen,
          child: Padding(
            padding: EdgeInsets.only(
                left: widthScreen * 0.07, right: widthScreen * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Endereço por " + consult.cep!,
                  style: TextStyle(fontSize: widthScreen * 0.06),
                ),
                SizedBox(
                  height: heightScreen * 0.1,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: heightScreen * 0.4,
                    width: widthScreen,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RowText("UF:", consult.uf),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        RowText("CIDADE:", consult.cidade),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        RowText("BAIRRO:", consult.bairro),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        RowText("ENDEREÇO:", consult.end),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        RowText(titleComplement, complement),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
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
