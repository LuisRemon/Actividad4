import 'package:flutter/material.dart';

class MisReservas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xFF4B39EF),
            title: const Text(
              'Mis Reservas',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'ReadexPro',
                  fontWeight: FontWeight.bold
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(
                fontFamily: 'ReadexPro',
              ),
              tabs: [
                Tab(text: 'Activas'),
                Tab(text: 'Pasadas'),
                Tab(text: 'Canceladas'),
              ]
            ),
            // elevation: 0,
          ),
          body: TabBarView(
             children: <Widget>[
               Activas(),
               Pasadas(),
               Canceladas()
             ],
          ),
        )
    );
  }
}

Widget aulaReservada(BuildContext context, String aula, String fecha, String hora, String imagePath) {
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
                    fecha,
                    style: const TextStyle(
                      fontFamily: 'ReadexPro',
                      fontSize: 14,
                      color: Color(0xFF57636C),
                    ),
                  ),
                  Text(
                    hora,
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

class Activas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget> [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,//Color(0xFFF1F4F8),
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
                          aulaReservada(context, 'Aula 101', '05/10/23', '10:00 AM - 12:00 PM', 'assets/images/aula101.jpg'),
                        ]
                      ),
                    ),
                  ]
                ),
              ),
            ]
          )
        ],
      ),
    );
  }
}

class Pasadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget> [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,//Color(0xFFF1F4F8),
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
                          aulaReservada(context, 'Aula 102', '05/10/23', '10:00 AM - 12:00 PM', 'assets/images/aula102.jpg'),
                          aulaReservada(context, 'Aula 103', '04/10/23', '03:00 PM - 05:00 PM', 'assets/images/aula103.jpg'),
                          aulaReservada(context, 'Aula 104', '03/10/23', '04:00 PM - 06:00 PM', 'assets/images/aula104.jpg'),
                        ]
                      ),
                    ),
                  ]
                ),
              ),
            ]
          )
        ],
      ),
    );
  }
}

class Canceladas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget> [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,//Color(0xFFF1F4F8),
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
                          aulaReservada(context, 'Aula 101', '03/10/23', '04:00 PM - 06:00 PM', 'assets/images/aula101.jpg'),
                        ]
                      ),
                    ),
                  ]
                ),
              ),
            ]
          )
        ],
      ),
    );
  }
}