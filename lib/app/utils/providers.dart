import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../data/repositories/search_packages/search_package_repository.dart';
import '../services/api/api_service.dart';
import '../services/api/api_service_imp.dart';
import '../services/database/database.dart';
import '../services/database/local_database.dart';
import '../views/search_package/search_controller.dart';

final providers = <InheritedProvider>[
  Provider<http.Client>(
    create: (context) => http.Client(),
    lazy: true,
  ),
  Provider<IDatabase>(
    create: (context) => LocalDatabase(),
    lazy: true,
  ),
  Provider<ApiService>(
    create: (context) => ApiServiceImp(client: context.read<http.Client>()),
    lazy: true,
  ),
  Provider<SearchPackageRepository>(
    create: (context) => SearchPackageRepository(apiService: context.read<ApiService>()),
  ),
  ChangeNotifierProvider<SearchPackagesController>(
    create: (context) => SearchPackagesController(packageRepository: context.read<SearchPackageRepository>()),
  ),
];
