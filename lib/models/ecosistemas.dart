import 'dart:convert';

Ecosistema ecosistemaFromJson(String str) => Ecosistema.fromJson(json.decode(str));

String ecosistemaToJson(Ecosistema data) => json.encode(data.toJson());

class Ecosistema {
    final int id;
    final String nombre;
    final String descripcion;
    final String imagen;

    Ecosistema({
        required this.id,
        required this.nombre,
        required this.descripcion,
        required this.imagen,
    });

    factory Ecosistema.fromJson(Map<String, dynamic> json) => Ecosistema(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "imagen": imagen,
    };
}