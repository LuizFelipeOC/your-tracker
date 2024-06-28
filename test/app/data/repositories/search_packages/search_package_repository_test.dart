import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/app/data/repositories/search_packages/search_package_repository.dart';
import 'package:your_tracker/app/services/api/api_results.dart';
import 'package:your_tracker/app/services/api/api_service.dart';

import '../../../../duumies/package_dummies.dart';

class ApiServiceMock extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late SearchPackageRepository searchPackageRepository;

  setUpAll(() {
    apiService = ApiServiceMock();
    searchPackageRepository = SearchPackageRepository(apiService: apiService);
  });

  tearDownAll(() {
    apiService = ApiServiceMock();
    searchPackageRepository = SearchPackageRepository(apiService: apiService);
  });

  test('Should test when api service returned unauthorized package', () async {
    when(() => apiService.get(queryParams: {'codigo': 'NC162219187BR'})).thenAnswer((_) async {
      return Failure(FailureApi(message: 'HTML RESPONSE', statusCode: 401));
    });

    final result = await searchPackageRepository.get(code: 'NC162219187BR');

    expect(result.isError(), isTrue);

    result.onFailure((onFailure) {
      expect(onFailure.message, 'Unauthorized');
    });

    verify(() => apiService.get(queryParams: {'codigo': 'NC162219187BR'})).called(1);
  });

  test('Should test when api service returned exception request', () async {
    when(() => apiService.get(queryParams: {'codigo': 'NC162219187BR'})).thenThrow(Exception('Example'));

    final result = await searchPackageRepository.get(code: 'NC162219187BR');

    expect(result.isError(), isTrue);

    result.onFailure((onFailure) {
      expect(onFailure.message, 'Exception: Example');
    });

    verify(() => apiService.get(queryParams: {'codigo': 'NC162219187BR'})).called(1);
  });

  test('Should test when api service returned the package', () async {
    when(() => apiService.get(queryParams: {'codigo': 'NC162219187BR'})).thenAnswer((_) async {
      return Success(SuccessApi(data: packageDummies));
    });

    final result = await searchPackageRepository.get(code: 'NC162219187BR');

    expect(result.isSuccess(), isTrue);

    result.onSuccess((onSuccess) {
      expect(onSuccess.package.code, 'NC162219187BR');
      expect(onSuccess.package.events, isNotEmpty);
    });

    verify(() => apiService.get(queryParams: {'codigo': 'NC162219187BR'})).called(1);
  });
}
