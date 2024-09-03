import 'package:exploregalapagos/models/usuario.dart';

class Comentario {
  final int id;
  final Usuario usuario;
  final String comentario;
  final DateTime fecha;
  final String hora;

  Comentario({
    required this.id,
    required this.usuario,
    required this.comentario,
    required this.fecha,
    required this.hora,
  });

  factory Comentario.fromJson(Map<String, dynamic> json) => Comentario(
        id: json["id"],
        usuario: Usuario.fromJson(json["usuario"]),
        comentario: json["comentario"],
        fecha: DateTime.parse(json["fecha"]),
        hora: json["hora"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario.toJson(),
        "comentario": comentario,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "hora": hora,
      };
}
