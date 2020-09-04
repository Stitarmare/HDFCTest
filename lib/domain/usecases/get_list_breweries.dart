import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';
import 'package:hdfcTestApp/domain/repositories/get_list_breweries_repository.dart';

class GetListBreweriesUsecase {
  GetListBreweriesRepository _breweriesRepository;
  GetListBreweriesUsecase(this._breweriesRepository);
  Future<List<ListBreweriesEntity>> call() {
    return _breweriesRepository.getBreweries();
  }
}
