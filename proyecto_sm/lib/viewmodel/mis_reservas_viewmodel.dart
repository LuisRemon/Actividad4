import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_sm/api_connection/api_connection.dart';
import 'package:proyecto_sm/model/reserva_model.dart';
import '../model/user_model.dart';

class MisReservasViewModel {
  final UserData userData;

  MisReservasViewModel(this.userData);

  Function()? onReservasUpdated;

  Future<List<Reserva>> getReservas(int idEstado, int codUsuario) async {
    List<Reserva> ListaReservas = [];
    final response = await http.get(Uri.parse(API.consultareservas + "?id_estado=$idEstado&codigo_usuario=$codUsuario"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['success']) {
        List<dynamic> reservas = data["reservas"];
        for(var reserva in reservas) {
          Reserva objReserva = Reserva(
            idReserva: int.parse(reserva['id_reserva']),
            horaInicio: int.parse(reserva['hora_inicio']),
            horaFin: int.parse(reserva['hora_fin']),
            dia: reserva['dia'],
            fecha: reserva['fecha'],
            idEstado: int.parse(reserva['id_estado']),
            codigoUsuario: int.parse(reserva['codigo_usuario']),
            idSalon: int.parse(reserva['id_salon']),
            nombre: reserva['nombre'],
            pabellon: reserva['pabellon'],
            imagen: reserva['imagen']
          );
          ListaReservas.add(objReserva);
        }
      }else {
        // Manejar el caso en el que no se encontraron registros.
      }
    }else {
      // Manejar errores de conexión.
    }
    return ListaReservas;
  }

  Future<void> updateReserva(int idReserva) async {
    final response = await http.post(
      Uri.parse(API.updatereservas),
      body: {
        'id_reserva': idReserva.toString()
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['success']) {
        if (onReservasUpdated != null) {
          onReservasUpdated!();
        }
        print("Información actualizada exitosamente.");
      }else{
        print("Hubo un error al ejecutar los cambios.");
      }
    }
  }

  Future<void> updateDisponibilidad(int idSalon, String pabellon, String dia, int horaInicio, int horaFin) async {
    // Realizar la solicitud POST
    var response = await http.post(
      Uri.parse(API.updatedisponibilidadcancelar),
      body: {
        'id_salon': idSalon.toString(),
        'pabellon': pabellon,
        'dia': dia,
        'hora_inicio': horaInicio.toString(),
        'hora_fin': horaFin.toString()
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['success']) {
        // Éxito en la actualización
        print('Actualización exitosa');
      } else {
        // Manejar error en la actualización
        print('Error en la actualización: ${jsonResponse['error']}');
      }
    } else {
      // Error en la solicitud HTTP
      print('Error de conexión: ${response.reasonPhrase}');
    }
  }
}
