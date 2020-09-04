part of 'getbrewerie_bloc.dart';

@immutable
abstract class GetbrewerieEvent {
  const GetbrewerieEvent();
}

class GetBrewerieList extends GetbrewerieEvent {}
