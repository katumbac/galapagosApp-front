class TipoNegocio {
    final int id;
    final String tipo;

    TipoNegocio({
        required this.id,
        required this.tipo,
    });

    factory TipoNegocio.fromJson(Map<String, dynamic> json) => TipoNegocio(
        id: json["id"],
        tipo: json["tipo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
    };
}