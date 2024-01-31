class Weather {
  late final String icon;
  late final String text;
  late final int maxTemp;
  late final int minTemp;
  late final List hour;

  Weather({
    required this.icon,
    required this.text,
    required this.maxTemp,
    required this.minTemp,
    required this.hour,
  });

  factory Weather.fromJson(dynamic json) {
    return Weather(
      icon: (json['day']['condition']['icon'] as String),
      text: json['day']['condition']['text'] as String,
      maxTemp: json['day']['maxtemp_c'].round(),
      minTemp: json['day']['mintemp_c'].round(),
      hour: json['hour'] as List,
    );
  }
  static List<Weather> weatherFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Weather.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{"icon": "$icon", "text": $text, "maxTemp": $maxTemp, "minTemp": $minTemp, "hour": $hour}';
  }
}

class Weather2 {
  late final String city;

  Weather2({
    required this.city,
  });
  factory Weather2.fromJson(dynamic json) {
    return Weather2(
      city: json['name'].toString(),
    );
  }
  static List<Weather2> weatherFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Weather2.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return '{"city": "$city",}';
  }
}
