import '../../../services/local_storage/local_storage_dart.dart';
import '../../../services/local_storage/shared_preferences_service.dart';

class CheckFirstRunApp {
  final ILocalStorage secureStorage;
  final SharedPrefenceService preferencesStorage;

  CheckFirstRunApp({required this.preferencesStorage, required this.secureStorage});

  Future<void> checkDevice() async {
    final preferences = await preferencesStorage.read(key: 'first_run');

    preferences.onFailure((failure) {
      secureStorage.deleteAll();
    });

    await preferencesStorage.save(key: 'first_run', value: false);

    return;
  }
}
