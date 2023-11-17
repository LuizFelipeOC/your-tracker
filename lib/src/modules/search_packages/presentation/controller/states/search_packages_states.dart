import '../../../data/models/packages_model.dart';

abstract interface class SearchPackagesState {}

final class IdleSearchPackagesState extends SearchPackagesState {}

final class LoadingSearchPackagesState extends SearchPackagesState {}

final class LoadedSearchPackagesState extends SearchPackagesState {
  final PackagesModel packagesModel;

  LoadedSearchPackagesState({required this.packagesModel});
}

final class ErrorSearchPackagesState extends SearchPackagesState {}

final class LoadingFavoriteState extends SearchPackagesState {}

final class SuccessFavoriteState extends SearchPackagesState {
  PackagesModel package;

  SuccessFavoriteState({required this.package});
}

final class ErrorFavoriteState extends SearchPackagesState {
  String message;

  ErrorFavoriteState({required this.message});
}
