import 'dart:convert';
import './lecturer.dart';

class WeekDto {
    String name;
    String subname;
    LecturerDto lecturer;
    String location;
    List<dynamic> tags;
    List<String> userEvents;
    int startAt;
    int endAt;
    bool weekBreak;
    String status;

    WeekDto({
        this.name,
        this.subname,
        this.lecturer,
        this.location,
        this.tags,
        this.userEvents,
        this.startAt,
        this.endAt,
        this.weekBreak,
        this.status,
    });

    WeekDto copyWith({
        String name,
        String subname,
        LecturerDto lecturer,
        String location,
        List<dynamic> tags,
        List<String> userEvents,
        int startAt,
        int endAt,
        bool weekBreak,
        String status,
    }) => 
        WeekDto(
            name: name ?? this.name,
            subname: subname ?? this.subname,
            lecturer: lecturer ?? this.lecturer,
            location: location ?? this.location,
            tags: tags ?? this.tags,
            userEvents: userEvents ?? this.userEvents,
            startAt: startAt ?? this.startAt,
            endAt: endAt ?? this.endAt,
            weekBreak: weekBreak ?? this.weekBreak,
            status: status ?? this.status,
        );

    factory WeekDto.fromRawJson(String str) => WeekDto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeekDto.fromJson(Map<String, dynamic> json) => WeekDto(
        name: json["name"],
        subname: json["subname"],
        lecturer: LecturerDto.fromJson(json["lecturer"]),
        location: json["location"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        userEvents: List<String>.from(json["user_events"].map((x) => x)),
        startAt: json["start_at"],
        endAt: json["end_at"],
        weekBreak: json["break"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "subname": subname,
        "lecturer": lecturer.toJson(),
        "location": location,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "user_events": List<dynamic>.from(userEvents.map((x) => x)),
        "start_at": startAt,
        "end_at": endAt,
        "break": weekBreak,
        "status": status,
    };
}