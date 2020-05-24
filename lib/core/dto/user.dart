const GroupTranslator = {
  'none': 'Не выбрана',
  'pr20': 'ПР-20',
  'pr21': 'ПР-21',
};

class UserDTO {
  String id;
  String displayName;
  String email;
  String avatarUrl;
  String registrationDate;
  String group;
  Notifications notifications;

  UserDTO(
      {this.id,
      this.displayName,
      this.email,
      this.avatarUrl,
      this.registrationDate,
      this.group,
      this.notifications});

  UserDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    email = json['email'];
    avatarUrl = json['avatar_url'];
    registrationDate = json['registration_date'];
    group = json['group'];
    notifications = json['notifications'] != null
        ? new Notifications.fromJson(json['notifications'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['email'] = this.email;
    data['avatar_url'] = this.avatarUrl;
    data['registration_date'] = this.registrationDate;
    data['group'] = this.group;
    if (this.notifications != null) {
      data['notifications'] = this.notifications.toJson();
    }
    return data;
  }
}

class Notifications {
  bool updates;
  bool pm;
  bool mentions;

  Notifications({this.updates, this.pm, this.mentions});

  Notifications.fromJson(Map<String, dynamic> json) {
    updates = json['updates'];
    pm = json['pm'];
    mentions = json['mentions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updates'] = this.updates;
    data['pm'] = this.pm;
    data['mentions'] = this.mentions;
    return data;
  }
}
