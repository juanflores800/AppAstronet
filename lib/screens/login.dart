import 'dart:async';
//import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher_string.dart';
//import 'package:flutter/gestures.dart';
import 'package:version1_2/conexion.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:version1_2/validarCR.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

String nombre = '';
String estado = '';
String plan = '';
String deuda = '';
String observacion = '';
bool showTable = false;

ValidarCr validar = new ValidarCr();

class _LoginPageState extends State<LoginPage> {
  int activeIndex = 0;
  String _searchQuery = '';

  Future<void> _buscar() async {
    //print('Buscando $_searchQuery');
    var v = await Buscar(_searchQuery);
    //print('holass');
    //print(v);
    bool estadoC = false;
    estadoC = validar.verificarCedula(_searchQuery);
    print(estadoC);
    if (v[1].toString() == 'n') {
      _showAlertDialog();
      _searchQuery == "";

      showTable = false;
    } else {
      showTable = true;
      int tamano = v.length;
//      if (tamano == 4) {
      //      observacion = " ";
      //  } else {
//        observacion = v[4];
      //    }
      //intento variables
      if (v[3].toString() == "0") {
        _showAlertDialogDia();
      }

      if (tamano == 5) {
        nombre = v[1];
        String espl = v[2].toString();
        final splitted = espl.split('-');
        int n = splitted.length;
        if (n == 3) {
          estado = splitted[0];
          plan = "${splitted[1]}-${splitted[2]}";
        } else {
          estado = splitted[0];
          plan = splitted[1];
        }
        deuda = v[3];
        observacion = v[4];
      }
      if (tamano == 4) {
        nombre = v[1];
        String espl = v[2].toString();
        final splitted = espl.split('-');
        int n = splitted.length;

        if (n == 3) {
          estado = splitted[0];
          plan = "${splitted[1]}-${splitted[2]}";
        } else {
          estado = splitted[0];
          plan = splitted[1];
        }

        deuda = v[3];
        observacion = " ";
      } else {
        if (tamano == 3) {
          nombre = v[1];
          String espl = v[2].toString();
          final splitted = espl.split('-');
          int n = splitted.length;
          if (n == 3) {
            estado = splitted[0];
            plan = "${splitted[1]}-${splitted[2]}";
          } else {
            estado = splitted[0];
            plan = splitted[1];
          }
          deuda = " ";
          observacion = " ";
        } else {
          if (tamano == 2) {
            nombre = v[1];
            estado = " ";
            deuda = " ";
            observacion = " ";
          }
        }
      }
      //------------------
//      nombre = v[1];

      //    estado = v[2];

      //  deuda = v[3];

      //observacion = v[4];
    }
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: const Text("Aviso!"),
            content: const Text("Cédula ingresada SIN resultados."),
            actions: <Widget>[
              ElevatedButton(
                child: const Text(
                  "CERRAR",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showAlertDialogDia() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: const Text("Aviso!"),
            content: const Text("El cliente esta al día en sus pagos."),
            actions: <Widget>[
              ElevatedButton(
                child: const Text(
                  "Aceptar",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    // ignore: prefer_const_constructors
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: activeIndex == 0 ? 1 : 0,
                    duration: const Duration(
                      seconds: 1,
                    ),
                    curve: Curves.linear,
                    child: Image.network(
                      'https://www.astronet.ec/wp-content/uploads/2022/10/PLAN-ESTRELLA-02.jpg',
                      height: 10,
                      scale: 1.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: activeIndex == 1 ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Image.network(
                      'https://www.astronet.ec/wp-content/uploads/2022/10/PLAN-ASTRO-1.jpg',
                      height: 400,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: activeIndex == 2 ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Image.network(
                      'https://www.astronet.ec/wp-content/uploads/2022/10/PLAN-ESPACIAL-1.jpg',
                      height: 400,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedOpacity(
                    opacity: activeIndex == 3 ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear,
                    child: Image.network(
//                      'https://www.astronet.ec/wp-content/uploads/2022/10/PLAN-ESTRELLA-02.jpg',
                      'https://www.astronet.ec/wp-content/uploads/2022/10/ASTROWEB-01.jpg',
                      height: 400,
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'DEUDAS PENDIENTES - ASTRONET',
              style: TextStyle(fontSize: 20, color: Colors.redAccent),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0.0),
                labelText: 'CLIENTE',
                hintText: 'Cédula/Ruc',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                prefixIcon: const Icon(
                  Iconsax.user,
                  color: Colors.black,
                  size: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: _searchQuery.isNotEmpty ? _buscar : null,
              height: 45,
              color: const Color.fromARGB(255, 129, 127, 127),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                "CONSULTAR",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            tablas(),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Tienes alguna duda?',
                  style: TextStyle(
                      fontFamily: 'Dosis',
                      color: Colors.grey.shade600,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  child: const Text(
                    ' PREGUNTAR',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () async {
                    String numero = "+986247908";
                    var url =
                        'https://wa.me/$numero?text=Hola ASTRONET, por favor su ayuda con ';
                    try {
                      // ignore: deprecated_member_use
                      await launch(url);
                    } catch (err) {
                      debugPrint('Error at open link wpp');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

TableRow buildRow(List<String> cells) => TableRow(
      children: cells.map((cell) {
        // {bool isHeader = false}
        // final style = TextStyle(
        //   fontWeight: cell. ? FontWeight.bold : FontWeight.normal,
        //   fontSize: 18,
        // );
        return Padding(
          padding: const EdgeInsets.all(3),
          child: Center(child: Text(cell)),
        );
      }).toList(),
    );
//TableRow(children: cells.map((cell) => Text(cell)).toList());
Widget tablas() {
  if (showTable) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {1: FractionColumnWidth(0.68)},
      border: TableBorder.all(color: Colors.blueGrey, width: 1.8),
      children: [
        buildRow(['NOMBRE', nombre]),
        buildRow(['ESTADO DE SERVICIO', estado]),
        buildRow(['PLAN CONTRATADO', plan]),
        buildRow(['DEUDA ', '\$$deuda']),
        buildRow(['MENSAULIDAD', observacion]),
      ],
    );
  }
  return Table();
}
