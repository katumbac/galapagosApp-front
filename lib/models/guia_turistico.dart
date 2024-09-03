import 'package:exploregalapagos/models/isla.dart';

class GuiaTuristico {
    final int id;
    final String nombre;
    final int edad;
    final String telefono;
    final String imagen;
    final Isla isla;

    GuiaTuristico({
        required this.id,
        required this.nombre,
        required this.edad,
        required this.telefono,
        required this.imagen,
        required this.isla,
    });

    factory GuiaTuristico.fromJson(Map<String, dynamic> json) => GuiaTuristico(
        id: json["id"],
        nombre: json["nombre"],
        edad: json["edad"],
        telefono: json["telefono"],
        imagen: json["imagen"],
        isla: Isla.fromJson(json["isla"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "edad": edad,
        "telefono": telefono,
        "imagen": imagen,
        "isla": isla.toJson(),
    };
}