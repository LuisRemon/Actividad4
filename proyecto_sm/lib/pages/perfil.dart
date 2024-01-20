import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:proyecto_sm/view/mi_informacion_view.dart';
import 'mis_reservas.dart';
import 'package:proyecto_sm/model/user_model.dart';

class Perfil extends StatefulWidget {
  final UserData userData;
  const Perfil({Key? key, required this.userData}) : super(key: key);

  @override
  _Perfil createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  final unfocusNode = FocusNode();
  bool? switchValue;
  UserData? userData; //?

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return GestureDetector(
      onTap: () => unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF4B39EF),
        body: Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 200,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/Logo_Usuario.png',
                                width: 180,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                child: Text(
                  '${userData?.nombre} ${userData?.apellidoPaterno}',
                  textAlign: TextAlign.center,
                  style: const TextStyle( // Corregido: FlutterFlowTheme.of(context).headlineSmall.override(...)
                    fontFamily: 'Outfit',
                    color: Colors.white, // Cambiado: FlutterFlowTheme.of(context).info
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                child: Text(
                  '${userData?.correo}',
                  style: const TextStyle( // Corregido: FlutterFlowTheme.of(context).titleSmall.override(...)
                    fontFamily: 'ReadexPro',
                    color: Colors.white, // Cambiado: FlutterFlowTheme.of(context).accent4
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white, // Cambiado: FlutterFlowTheme.of(context).secondaryBackground
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x33000000),
                        offset: Offset(0, -1),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                                child: Text(
                                  'Ajustes',
                                  style: TextStyle( // Corregido: FlutterFlowTheme.of(context).headlineSmall
                                    fontFamily: 'Outfit',
                                    fontSize: 24, // Tamaño de fuente añadido
                                    color: Color(0xFF14181B), // Cambiado: FlutterFlowTheme.of(context).info
                                  ),
                                ),
                              ),
                              OpcionAjustes(context, userData!, Icons.edit, 'Información personal', 'Editar Perfil', MiInformacion(userData: userData!)),
                              OpcionAjustes(context, userData!, Icons.calendar_month, 'Ver mis reservas', 'Historial', MisReservas()),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 16, 8),
                                      child: Icon(
                                        Icons.notifications_active,
                                        color: Color(0xFF57636C),
                                        size: 24,
                                      ),
                                    ),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 12, 0),
                                        child: Text(
                                          'Mostrar notificaciones',
                                          textAlign: TextAlign.start,
                                          style:
                                            TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'ReadexPro',
                                              color: Color(0xFF57636C),
                                            )
                                        ),
                                      ),
                                    ),
                                    Switch.adaptive(
                                      value: switchValue ??= true, // crear bool para el valor
                                      onChanged: (newValue) async {
                                        setState(() => switchValue = newValue!);
                                      },
                                      activeColor: const Color(0xFF4B39EF),
                                      activeTrackColor: const Color(0x4D4B39EF),
                                      inactiveTrackColor: const Color(0xFFE0E3E7),
                                      inactiveThumbColor: const Color(0xFF57636C),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: InkWell(
                                  onTap: _showRatingDialog,
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 16, 8),
                                        child: Icon(
                                          Icons.star,
                                          color: Color(0xFF57636C),
                                          size: 24,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                          child: Text(
                                            'Califícanos',
                                            textAlign: TextAlign.start,
                                            style:
                                              TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'ReadexPro',
                                                color: Color(0xFF57636C),
                                              )
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Deja un comentario',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'ReadexPro',
                                          color: Color(0xFF4B39EF),
                                          fontSize: 14, // Tamaño de fuente personalizado
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: InkWell(
                                  onTap: () {Navigator.pop(context);},
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 16, 8),
                                        child: Icon(
                                          Icons.login_rounded,
                                          color: Color(0xFF57636C),
                                          size: 24,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 12, 0),
                                          child: Text(
                                              'Salir de mi cuenta',
                                              textAlign: TextAlign.start,
                                              style:
                                              TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'ReadexPro',
                                                color: Color(0xFF57636C),
                                              )
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Cerrar Sesión',
                                        style: TextStyle(
                                          fontFamily: 'ReadexPro',
                                          color: Color(0xFF4B39EF),
                                          fontSize: 14, // Peso de fuente personalizado
                                          // Otros atributos de estilo de texto que desees personalizar
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void _showRatingDialog() {
    // actual store listing review & rating
    void _rateAndReviewApp() async {
      // refer to: https://pub.dev/packages/in_app_review
      final _inAppReview = InAppReview.instance;

      if (await _inAppReview.isAvailable()) {
        print('request actual review from store');
        _inAppReview.requestReview();
      } else {
        print('open actual store listing');
        // TODO: use your own store ids
        _inAppReview.openStoreListing(
          appStoreId: '<your app store id>',
          microsoftStoreId: '<your microsoft store id>',
        );
      }
    }

    final _dialog = RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Puntúanos',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        '¿Te está gustando nuestra aplicación? ¡Califícanos y déjanos tus comentarios.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset('assets/images/logo_unmsm_morado.png', width: 100, height: 100),
      submitButtonText: 'Enviar',
      commentHint: '¡Deja tu comentario!',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          _rateAndReviewApp();
        }
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }
}

Widget OpcionAjustes(BuildContext context, UserData userData, IconData icono, String nombreOpcion, String detalleOpcion, Widget ventana){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
    child: InkWell(
      onTap: () {
        if (userData != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ventana,
            ),
          );
        } else {
            // Manejar el caso en el que userData es nulo
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 16, 8),
            child: Icon(
              icono,
              color: const Color(0xFF57636C),
              size: 24,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
              child: Text(nombreOpcion,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'ReadexPro',
                  color: Color(0xFF57636C),
                )
              ),
            ),
          ),
          Text(
            detalleOpcion,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'ReadexPro',
              color: Color(0xFF4B39EF),
              fontSize: 14, // Tamaño de fuente personalizado
            ),
          ),
        ],
      ),
    )
  );
}