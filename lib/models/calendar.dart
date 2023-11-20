class Calendar {
  String kind;
  String id;
  bool selected;
  String? etag;
  String? summary;
  String? timeZone;
  String? colorId;
  String? backgroundColor;
  String? foregroundColor;
  String? accessRole;

  Calendar(this.kind, this.id, this.selected);

  factory Calendar.fromJson(Map<String, dynamic> json) {
    Calendar newCalendar = Calendar(
        json['kind'] as String, json['id'] as String, json['selected'] as bool);

    if (json.containsKey('etag')) {
      newCalendar.etag = json['etag'];
    }
    if (json.containsKey('summary')) {
      newCalendar.summary = json['summary'];
    }
    if (json.containsKey('timeZone')) {
      newCalendar.timeZone = json['timeZone'];
    }
    if (json.containsKey('colorId')) {
      newCalendar.colorId = json['colorId'];
    }
    if (json.containsKey('backgroundColor')) {
      newCalendar.backgroundColor = json['backgroundColor'];
    }
    if (json.containsKey('foregroundColor')) {
      newCalendar.foregroundColor = json['foregroundColor'];
    }
    if (json.containsKey('accessRole')) {
      newCalendar.accessRole = json['accessRole'];
    }

    return newCalendar;
  }
}
