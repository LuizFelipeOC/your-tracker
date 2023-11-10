class DrawerRoutesModel {
  final String routes;
  final String title;

  DrawerRoutesModel({
    required this.routes,
    required this.title,
  });

  factory DrawerRoutesModel.fromMap(Map<String, dynamic> map) {
    return DrawerRoutesModel(
      routes: map['routes'] as String,
      title: map['title'] as String,
    );
  }
}
