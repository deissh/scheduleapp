// To parse this JSON data, do
//
//     final motd = motdFromJson(jsonString);

import 'dart:convert';

class MotdDTO {
    DateTime createdAt;
    String message;
    String type;
    String typeColor;

    MotdDTO({
        this.createdAt,
        this.message,
        this.type,
        this.typeColor,
    });

    MotdDTO copyWith({
        String id,
        String createdAt,
        String message,
        String type,
        String typeColor,
    }) =>
        MotdDTO(
            createdAt: createdAt ?? this.createdAt,
            message: message ?? this.message,
            type: type ?? this.type,
            typeColor: typeColor ?? this.typeColor,
        );

    factory MotdDTO.fromJson(String str) => MotdDTO.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MotdDTO.fromMap(Map<String, dynamic> json) => MotdDTO(
        createdAt: DateTime.parse(json["created_at"]).toLocal(),
        message: json["message"],
        type: json["type"],
        typeColor: json["type_color"],
    );

    Map<String, dynamic> toMap() => {
        "created_at": createdAt.toIso8601String(),
        "message": message,
        "type": type,
        "type_color": typeColor,
    };
}
