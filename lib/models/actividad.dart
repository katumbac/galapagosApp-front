import 'package:exploregalapagos/models/isla.dart';

class Actividad {
    final int id;
    final String nombre;
    final String direccion;
    final String horaInicio;
    final String horaFin;
    final int edad;
    final String precio;
    final Isla isla;
    final String imagen;

    Actividad({
        required this.id,
        required this.nombre,
        required this.direccion,
        required this.horaInicio,
        required this.horaFin,
        required this.edad,
        required this.precio,
        required this.isla,
        required this.imagen,
    });

    factory Actividad.fromJson(Map<String, dynamic> json) => Actividad(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        horaInicio: json["hora_inicio"],
        horaFin: json["hora_fin"],
        edad: json["edad"],
        precio: json["precio"],
        isla: Isla.fromJson(json["isla"]),
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "hora_inicio": horaInicio,
        "hora_fin": horaFin,
        "edad": edad,
        "precio": precio,
        "isla": isla.toJson(),
        "imagen": imagen,
    };
}
