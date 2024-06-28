import 'events_model.dart';

class PackageModel {
  String code;
  String lastUpdate;
  List<EventsModel> events;

  PackageModel({
    required this.code,
    required this.lastUpdate,
    required this.events,
  });

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      code: map['codigo'] as String,
      lastUpdate: map['ultimo'] as String,
      events: (map['eventos'] as List<dynamic>).map((event) => EventsModel.fromMap(event as Map<String, dynamic>)).toList(),
    );
  }
}
