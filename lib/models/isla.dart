class Isla {
    final int id;
    final String nombre;
    final int calificacionTres;
    final int calificacionDos;
    final int calificacionUno;
    final String descripcion;
    final String imagen;

    Isla({
        required this.id,
        required this.nombre,
        required this.calificacionTres,
        required this.calificacionDos,
        required this.calificacionUno,
        required this.descripcion,
        required this.imagen,
    });

    factory Isla.fromJson(Map<String, dynamic> json) => Isla(
        id: json["id"],
        nombre: json["nombre"],
        calificacionTres: json["calificacion_tres"],
        calificacionDos: json["calificacion_dos"],
        calificacionUno: json["calificacion_uno"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "calificacion_tres": calificacionTres,
        "calificacion_dos": calificacionDos,
        "calificacion_uno": calificacionUno,
        "descripcion": descripcion,
        "imagen": imagen,
    };
}