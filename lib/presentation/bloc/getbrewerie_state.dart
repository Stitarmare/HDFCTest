part of 'getbrewerie_bloc.dart';

@immutable
abstract class GetbrewerieState {
  const GetbrewerieState();
}

class Empty extends GetbrewerieState {}

class Loading extends GetbrewerieState {}

class Loaded extends GetbrewerieState {
  final List<ListBreweriesEntity> listBreweriesEntity;

  Loaded({@required this.listBreweriesEntity}) : super();
}

class Error extends GetbrewerieState {
  final String message;

  Error({@required this.message}) : super();
}
