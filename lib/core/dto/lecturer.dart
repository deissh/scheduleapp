import 'dart:convert';

class LecturerDto {
    int id;
    String firstName;
    String secondName;
    String patronymic;

    LecturerDto({
        this.id,
        this.firstName,
        this.secondName,
        this.patronymic,
    });

    LecturerDto copyWith({
        int id,
        String firstName,
        String secondName,
        String patronymic,
    }) => 
        LecturerDto(
            id: id ?? this.id,
            firstName: firstName ?? this.firstName,
            secondName: secondName ?? this.secondName,
            patronymic: patronymic ?? this.patronymic,
        );

    factory LecturerDto.fromRawJson(String str) => LecturerDto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LecturerDto.fromJson(Map<String, dynamic> json) => LecturerDto(
        id: json["id"],
        firstName: json["first_name"],
        secondName: json["second_name"],
        patronymic: json["patronymic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "second_name": secondName,
        "patronymic": patronymic,
    };
}
