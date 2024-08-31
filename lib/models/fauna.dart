class Fauna {
    final int id;
    final String nombreComun;
    final String nombreCientifico;
    final String dato;
    final String imagen;
    final String habitat;
    final String alimentacion;

    Fauna({
        required this.id,
        required this.nombreComun,
        required this.nombreCientifico,
        required this.dato,
        required this.imagen,
        required this.habitat,
        required this.alimentacion,
    });

    factory Fauna.fromJson(Map<String, dynamic> json) => Fauna(
        id: json["id"],
        nombreComun: json["nombre_comun"],
        nombreCientifico: json["nombre_cientifico"],
        dato: json["dato"],
        imagen: json["imagen"],
        habitat: json["habitat"],
        alimentacion: json["alimentacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_comun": nombreComun,
        "nombre_cientifico": nombreCientifico,
        "dato": dato,
        "imagen": imagen,
        "habitat": habitat,
        "alimentacion": alimentacion,
    };
}
