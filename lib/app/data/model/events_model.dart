class EventsModel {
  String date;
  String hours;
  String place;
  String status;
  List<String> subStatus;

  EventsModel({
    required this.date,
    required this.hours,
    required this.place,
    required this.status,
    required this.subStatus,
  });

  factory EventsModel.fromMap(Map<String, dynamic> map) {
    return EventsModel(
      date: map['data'] as String,
      hours: map['hora'] as String,
      place: map['local'] as String,
      status: map['status'] as String,
      subStatus: map['subStatus'] as List<String>,
    );
  }
}
