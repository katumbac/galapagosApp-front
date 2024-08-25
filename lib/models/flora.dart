class Flora {
    final int id;
    final String nombreComun;
    final String nombreCientifico;
    final String dato;
    final String imagen;
    final String distribucion;
    final String usos;

    Flora({
        required this.id,
        required this.nombreComun,
        required this.nombreCientifico,
        required this.dato,
        required this.imagen,
        required this.distribucion,
        required this.usos,
    });

    factory Flora.fromJson(Map<String, dynamic> json) => Flora(
        id: json["id"],
        nombreComun: json["nombre_comun"],
        nombreCientifico: json["nombre_cientifico"],
        dato: json["dato"],
        imagen: json["imagen"],
        distribucion: json["distribucion"],
        usos: json["usos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_comun": nombreComun,
        "nombre_cientifico": nombreCientifico,
        "dato": dato,
        "imagen": imagen,
        "distribucion": distribucion,
        "usos": usos,
    };
}
