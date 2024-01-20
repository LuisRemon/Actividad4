/*import 'package:flutter/material.dart';

class PrediccionWidget extends StatefulWidget {
  const PrediccionWidget({Key? key}) : super(key: key);

  @override
  _PrediccionWidgetState createState() => _PrediccionWidgetState();
}

class _PrediccionWidgetState extends State<PrediccionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle onTap
      },
      child: Scaffold(
        backgroundColor: Colors.white, // Set your background color here
        appBar: AppBar(
          backgroundColor: Color(0xFFF1F4F8),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF101213),
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Predicciones',
            style: TextStyle(
              fontFamily: 'Urbanist',
              color: Color(0xFF101213),
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Predicción de Reservas de Salones',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.black, // Set your text color here
                  ),
                ),
                Text(
                  'Hello World',
                  style: TextStyle(
                    // Define your text style
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    'Estimado diario',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.black, // Set your text color here
                    ),
                  ),
                ),
                Text(
                  '45',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    color: Colors.black, // Set your text color here
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey, // Set your background color here
                        ),
                        child: Align(
                          alignment: Alignment(0.0, 0.0),
                          child: Container(
                            width: 370,
                            height: 311,
                            child: Placeholder(), // Replace with your chart widget
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
      ),
    );
  }
}*/
