// To parse this JSON data, do
//
//     final motd = motdFromJson(jsonString);

import 'dart:convert';

class Motd {
    String id;
    DateTime createdAt;
    String message;
    String type;
    String typeColor;

    Motd({
        this.id,
        this.createdAt,
        this.message,
        this.type,
        this.typeColor,
    });

    Motd copyWith({
        String id,
        String createdAt,
        String message,
        String type,
        String typeColor,
    }) =>
        Motd(
            id: id ?? this.id,
            createdAt: createdAt ?? this.createdAt,
            message: message ?? this.message,
            type: type ?? this.type,
            typeColor: typeColor ?? this.typeColor,
        );

    factory Motd.fromJson(String str) => Motd.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Motd.fromMap(Map<String, dynamic> json) => Motd(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        message: json["message"],
        type: json["type"],
        typeColor: json["type_color"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "message": message,
        "type": type,
        "type_color": typeColor,
    };
}
