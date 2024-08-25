class Usuario {
    final int id;
    final String nickname;

    Usuario({
        required this.id,
        required this.nickname,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nickname: json["nickname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
    };
}