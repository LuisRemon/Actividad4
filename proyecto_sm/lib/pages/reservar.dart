import 'package:flutter/material.dart';
import 'package:proyecto_sm/pages/horario.dart';
import 'Calendario.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Reservar extends StatefulWidget {
  const Reservar({super.key});

  _ReservarState createState() => _ReservarState();
}

class _ReservarState extends State<Reservar> {
  var predValue = "Cargando..."; // Texto de carga inicial
  late Interpreter interpreter;

  @override
  void initState() {
    super.initState();
    _loadModelAndRunInference();
  }

  Future<void> _loadModelAndRunInference() async {
    interpreter = await Interpreter.fromAsset('assets/Modelo.tflite');
    final output = List.filled(1 * 1, 0.0).reshape([1, 1]); // Ajusta la forma a [1, 1]
    interpreter.run([96], output);
    setState(() {
      final parsedValue = double.parse(output[0][0].toString());
      predValue = parsedValue.round().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          titulo(context),
          //SfCalendar(),
          prediccionReservas(predValue),
          barraBusqueda(context),
          Filtros(),// Llamar a la función Filtros
          salones(context),
        ],
      ),
    );
  }

  @override
  void dispose() {
    interpreter.close();
    super.dispose();
  }
}

Widget titulo(context){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 65, vertical: 25),
    padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 10),
    width: MediaQuery.of(context).size.width,
    child: const Text(
      'Reserva de   Salones',
      style: TextStyle(
        fontSize: 24,
        fontFamily: 'Outfit',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

Widget prediccionReservas(var predValue){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
    child: Text(
      "Reservas estimadas para hoy: $predValue",
      style: TextStyle(fontSize: 16,
      fontFamily: 'ReadexPro',
      color: Colors.black,)
    ),
  );
}

class Filtros extends StatefulWidget {
  @override
  _FiltrosState createState() => _FiltrosState();
}

class _FiltrosState extends State<Filtros> {
  List<String> list = ['Seleccione la hora','One', 'Two', 'Three', 'Four'];
  String dropdownValue = "";

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398,
      height: 73,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: 178,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xFFC7C5C5),
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Seleccione el día',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'ReadexPro',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ],
              ),
            ),
          ),
          DropdownMenu<String>(
          initialSelection: list.first,
          onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
          },
          dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
          ),
        ],
      ),
    );
  }
}


Widget barraBusqueda(context){
  return Container(
    width: 600.0, // Ancho deseado de la barra de búsqueda
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(30.0), // Controla la forma redonda
    ),
    child: const TextField(
      decoration: InputDecoration(
        hintText: 'Buscar Aulas',
        prefixIcon: Icon(
            Icons.search,
            color: Colors.black), // Ícono de lupa
        border: InputBorder.none, // Elimina el borde predeterminado
        contentPadding: EdgeInsets.all(16.0), // Espacio interno
      ),
    ),
  );
}

Widget salones(context){
  return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFF1F4F8),
          ),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
                  child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        buildCenteredContainer(context, 'Aula 101', 'Nuevo Pabellón', 'assets/images/aula101.jpg'),
                        buildCenteredContainer(context, 'Aula 102', 'Nuevo Pabellón', 'assets/images/aula102.jpg'),
                        buildCenteredContainer(context, 'Aula 103', 'Antiguo Pabellón', 'assets/images/aula103.jpg'),
                      ]
                  ),
                ),
              ]
          ),
        ),
      ]
  );
}

Widget buildCenteredContainer(BuildContext context, String aula, String pabellon, String imagePath) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
    child: Container(
      width: 220,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE0E3E7),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 192,
                height: 144,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      aula,
                      style: const TextStyle(
                        fontFamily: 'ReadexPro',
                        fontSize: 16,
                        color: Color(0xFF14181B),
                      ),
                    ),
                  ),
                  Text(
                    pabellon,
                    style: const TextStyle(
                      fontFamily: 'ReadexPro',
                      fontSize: 14,
                      color: Color(0xFF57636C),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(
                        0.00, 0.00),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Horarios()),//TableEventsExample()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          // iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          backgroundColor: const Color(0xFF4B39EF),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(113.0, 40.0),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Bordes redondeados del botón
                            side: const BorderSide(
                              color: Colors.transparent, // Color del borde
                              width: 1, // Ancho del borde
                            ),
                          ),
                        ),
                        child: const Text(
                          'Ver detalles',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              fontFamily: 'ReadexPro'
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/*
void _showPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('PROCESO TERMINADO',style: TextStyle(
          color: Colors.red,),),


        content: const Text('Su reserva ha sido procesada con éxito'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Listo',
              style: TextStyle(
                color: Colors.red, // Color rojo para el texto del botón
              ),
            ),
          ),
        ],
      );
    },
  );
}
*/