import 'package:flutter/material.dart';
import 'package:proyecto_sm/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proyecto_sm/api_connection/api_connection.dart';

class MiInformacionViewModel {
  final UserData userData;
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  TextEditingController textController5 = TextEditingController();
  TextEditingController textController6 = TextEditingController();
  TextEditingController textController7 = TextEditingController();

  MiInformacionViewModel(this.userData);

  String? textController1Validator(String? value) {
    return null;
  }

  String? textController2Validator(String? value) {
    return null;
  }

  String? textController3Validator(String? value) {
    return null;
  }

  String? textController4Validator(String? value) {
    return null;
  }

  String? textController5Validator(String? value) {
    return null;
  }

  String? textController6Validator(String? value) {
    return null;
  }

  String? textController7Validator(String? value) {
    return null;
  }

  void updateUserInformation() async {
    User? user = FirebaseAuth.instance.currentUser;

    print('textController1: ${textController1.text}');
    print('textController2: ${textController2.text}');
    print('textController3: ${textController3.text}');
    print('textController4: ${textController4.text}');
    print('textController5: ${textController5.text}');
    print('textController6: ${textController6.text}');
    print('textController7: ${textController7.text}');

    if (user != null) {
      final response = await http.post(
        Uri.parse(API.updateperfil),
        body: {
          'nombre': textController1.text,
          'apellido_paterno': textController2.text,
          'apellido_materno': textController3.text,
          'ciclo': textController4.text,
          'escuela_profesional': textController5.text,
          'codigo': textController6.text,
          'correo': textController7.text,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success']) {
          print("Información actualizada exitosamente.");
        }else{
          print("Hubo un error al ejecutar los cambios.");
        }
      }
    }
  }
}
