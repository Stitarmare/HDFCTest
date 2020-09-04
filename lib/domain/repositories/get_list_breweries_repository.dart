import 'package:hdfcTestApp/data/model/list_brewerie_model.dart';
import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';

abstract class GetListBreweriesRepository {
  Future<List<ListBreweriesModel>> getBreweries();
}
