import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';
import 'package:hdfcTestApp/domain/usecases/get_list_breweries.dart';
import 'package:meta/meta.dart';

part 'getbrewerie_event.dart';
part 'getbrewerie_state.dart';

class GetbrewerieBloc extends Bloc<GetbrewerieEvent, GetbrewerieState> {
  final GetListBreweriesUsecase _breweriesUsecase;
  GetbrewerieBloc({@required GetListBreweriesUsecase breweriesUsecase})
      : assert(breweriesUsecase != null),
        _breweriesUsecase = breweriesUsecase,
        super(null);

  GetbrewerieState get initialState => Empty();
  @override
  Stream<GetbrewerieState> mapEventToState(
    GetbrewerieEvent event,
  ) async* {
    if (event is GetBrewerieList) {
      yield Loading();
      final value = await _breweriesUsecase.call();
      if (value != null) {
        yield Loaded(listBreweriesEntity: value);
      } else {
        yield Error(message: "No data found");
      }
    }
  }
}
