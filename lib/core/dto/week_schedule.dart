import 'dart:convert';
import './week.dart';

class WeekScheduleDto {
    int weekNum;
    List<List<WeekDto>> week;

    WeekScheduleDto({
        this.weekNum,
        this.week,
    });

    WeekScheduleDto copyWith({
        int weekNum,
        List<List<WeekDto>> week,
    }) => 
        WeekScheduleDto(
            weekNum: weekNum ?? this.weekNum,
            week: week ?? this.week,
        );

    factory WeekScheduleDto.fromRawJson(String str) => WeekScheduleDto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeekScheduleDto.fromJson(Map<String, dynamic> json) => WeekScheduleDto(
        weekNum: json["week_num"],
        week: List<List<WeekDto>>.from(json["week"].map((x) => List<WeekDto>.from(x.map((x) => WeekDto.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "week_num": weekNum,
        "week": List<dynamic>.from(week.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    };
}