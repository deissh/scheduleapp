import 'dart:convert';

class User {
  int id;
  String firstName;
  String secondName;
  String email;
  String avatarUrl;
  DateTime registrationDate;
  DateTime lastActivity;
  bool active;
  String bdate;
  String gender;
  Notifications notifications;

  User({
    this.id,
    this.firstName,
    this.secondName,
    this.email,
    this.avatarUrl,
    this.registrationDate,
    this.lastActivity,
    this.active,
    this.bdate,
    this.gender,
    this.notifications,
  });

  User copyWith({
    int id,
    String firstName,
    String secondName,
    String email,
    String avatarUrl,
    DateTime registrationDate,
    DateTime lastActivity,
    bool active,
    String bdate,
    String gender,
    Notifications notifications,
  }) =>
    User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      registrationDate: registrationDate ?? this.registrationDate,
      lastActivity: lastActivity ?? this.lastActivity,
      active: active ?? this.active,
      bdate: bdate ?? this.bdate,
      gender: gender ?? this.gender,
      notifications: notifications ?? this.notifications,
    );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    secondName: json["second_name"],
    email: json["email"],
    avatarUrl: json["avatar_url"],
    registrationDate: DateTime.parse(json["registration_date"]),
    lastActivity: DateTime.parse(json["last_activity"]),
    active: json["active"],
    bdate: json["bdate"],
    gender: json["gender"],
    notifications: Notifications.fromJson(json["notifications"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "second_name": secondName,
    "email": email,
    "avatar_url": avatarUrl,
    "registration_date": registrationDate.toIso8601String(),
    "last_activity": lastActivity.toIso8601String(),
    "active": active,
    "bdate": bdate,
    "gender": gender,
    "notifications": notifications.toJson(),
  };
}

class Notifications {
  bool updates;
  bool pm;
  bool mentions;

  Notifications({
    this.updates,
    this.pm,
    this.mentions,
  });

  Notifications copyWith({
    bool updates,
    bool pm,
    bool mentions,
  }) =>
    Notifications(
      updates: updates ?? this.updates,
      pm: pm ?? this.pm,
      mentions: mentions ?? this.mentions,
    );

  factory Notifications.fromRawJson(String str) =>
    Notifications.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    updates: json["updates"],
    pm: json["pm"],
    mentions: json["mentions"],
  );

  Map<String, dynamic> toJson() => {
    "updates": updates,
    "pm": pm,
    "mentions": mentions,
  };
}
