import '../../../../../core/data/models/packages_model.dart';

abstract interface class HomeState {}

final class IdleHomeState extends HomeState {}

final class LoadingHomeState extends HomeState {}

final class SuccessHomeState extends HomeState {
  List<PackagesModel> list;

  SuccessHomeState({required this.list});
}

final class ErrorHomeState extends HomeState {
  String message;

  ErrorHomeState({required this.message});
}

final class EmptyHomeState extends HomeState {}
