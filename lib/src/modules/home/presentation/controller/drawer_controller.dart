import 'package:flutter/material.dart';

import '../../data/model/drawer_routes_model.dart';

class HomeDrawerController {
  final List<DrawerRoutesModel> routes = [
    {
      'routes': '/findo-packages/',
      'title': 'Find Pakckages',
    },
    {
      'routes': '/favoritd-packages/',
      'title': 'My Favorites',
    },
    {
      'routes': '/terms-and-policies/',
      'title': 'Terms and Policies',
    },
  ].map((e) => DrawerRoutesModel.fromMap(e)).toList();

  final defineIcon = {
    'Terms and Policies': Icons.file_copy,
    'My Favorites': Icons.star_border,
    'Find Pakckages': Icons.search,
  };
}
