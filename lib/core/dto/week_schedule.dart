// To parse this JSON data, do
//
//     final allSchedules = allSchedulesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AllSchedules {
    List<List<Schedule>> pr20;

    AllSchedules({
        @required this.pr20,
    });

    AllSchedules copyWith({
        List<List<Schedule>> schedule,
    }) =>
        AllSchedules(
            pr20: schedule ?? this.pr20,
        );

    factory AllSchedules.fromJson(String str) => AllSchedules.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AllSchedules.fromMap(Map<String, dynamic> json) => AllSchedules(
        pr20: List<List<Schedule>>.from(json["pr20"].map((x) => List<Schedule>.from(x.map((x) => Schedule.fromMap(x))))),
    );

    Map<String, dynamic> toMap() => {
        "pr20": List<dynamic>.from(pr20.map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
    };
}

class Schedule {
    String name;
    String lecturer;
    String location;
    String startAt;
    String endAt;
    String type;
    String typeColor;

    Schedule({
        @required this.name,
        @required this.lecturer,
        @required this.location,
        @required this.startAt,
        @required this.endAt,
        @required this.type,
        @required this.typeColor,
    });

    Schedule copyWith({
        String name,
        String lecturer,
        String location,
        int startAt,
        int endAt,
        String type,
        String typeColor,
    }) =>
        Schedule(
            name: name ?? this.name,
            lecturer: lecturer ?? this.lecturer,
            location: location ?? this.location,
            startAt: startAt ?? this.startAt,
            endAt: endAt ?? this.endAt,
            type: type ?? this.type,
            typeColor: typeColor ?? this.typeColor,
        );

    factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        name: json["name"],
        lecturer: json["lecturer"] ?? "",
        location: json["location"] ?? "",
        startAt: json["start_at"] ?? "",
        endAt: json["end_at"] ?? "",
        type: json["type"] ?? "",
        typeColor: json["type_color"].replaceAll('#', '0x'),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "lecturer": lecturer,
        "location": location,
        "start_at": startAt,
        "end_at": endAt,
        "type": type,
        "type_color": typeColor.replaceAll('0x', '#'),
    };
}
