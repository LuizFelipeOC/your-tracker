import 'events_model.dart';

class PackagesModel {
  final String codigo;
  final List<EventsModel> eventos;

  PackagesModel({
    required this.codigo,
    required this.eventos,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'eventos': eventos.map((x) => x.toMap()).toList(),
    };
  }

  factory PackagesModel.fromMap(Map<String, dynamic> map) {
    return PackagesModel(
      codigo: map['codigo'] as String,
      eventos: List<EventsModel>.from(
        (map['eventos'] as List<dynamic>).map<EventsModel>(
          (x) => EventsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
