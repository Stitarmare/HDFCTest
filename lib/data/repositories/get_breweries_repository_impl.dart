import 'dart:convert';

import 'package:hdfcTestApp/data/localdatasource/local_web_datasource.dart';
import 'package:hdfcTestApp/data/model/list_brewerie_model.dart';
import 'package:hdfcTestApp/data/remotedatasource/get_list_breweries_datasource.dart';
import 'package:hdfcTestApp/domain/repositories/get_list_breweries_repository.dart';

class GetListBreweriesRepositoryImpl implements GetListBreweriesRepository {
  RemoteDataSource dataSource;
  LocalWebDatasource localWebDatasource;
  GetListBreweriesRepositoryImpl({this.dataSource, this.localWebDatasource});
  @override
  Future<List<ListBreweriesModel>> getBreweries() async {
    final value = localWebDatasource.getCookie("breweries") as String;
    if (value != null && value != "") {
      final jsonValue = json.decode(value);
      final listBrew = List<ListBreweriesModel>.from(
          jsonValue.map((x) => ListBreweriesModel.fromMap(x)));
      return listBrew;
    } else {
      final responce =
          await dataSource.get("https://api.openbrewerydb.org/breweries");
      if (responce.statusCode == 200) {
        localWebDatasource.addCookie("breweries", responce.body);
        final jsonValue = json.decode(responce.body);
        final listBrew = List<ListBreweriesModel>.from(
            jsonValue.map((x) => ListBreweriesModel.fromMap(x)));
        return listBrew;
      }
      return null;
    }
  }
}
