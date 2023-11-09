class EventsModel {
  String data;
  String hora;
  String local;
  String status;
  List<String>? subStatus;

  EventsModel({
    required this.data,
    required this.hora,
    required this.local,
    required this.status,
    this.subStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'hora': hora,
      'local': local,
      'status': status,
      'subStatus': subStatus,
    };
  }

  factory EventsModel.fromMap(Map<String, dynamic> map) {
    return EventsModel(
      data: map['data'] as String,
      hora: map['hora'] as String,
      local: map['local'] as String,
      status: map['status'] as String,
      subStatus: List<String>.from((map['subStatus'] ?? [])),
    );
  }
}
