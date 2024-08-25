import 'package:exploregalapagos/models/usuario.dart';

class Resena {
    final int id;
    final Usuario usuario;
    final String descripcion;
    final DateTime fecha;
    final String hora;
    final int negocio;

    Resena({
        required this.id,
        required this.usuario,
        required this.descripcion,
        required this.fecha,
        required this.hora,
        required this.negocio,
    });

    factory Resena.fromJson(Map<String, dynamic> json) => Resena(
        id: json["id"],
        usuario: Usuario.fromJson(json["usuario"]),
        descripcion: json["descripcion"],
        fecha: DateTime.parse(json["fecha"]),
        hora: json["hora"],
        negocio: json["negocio"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario.toJson(),
        "descripcion": descripcion,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "hora": hora,
        "negocio": negocio,
    };
}
