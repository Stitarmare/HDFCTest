import 'dart:convert';

import 'package:hdfcTestApp/data/localdatasource/local_web_datasource.dart';
import 'package:hdfcTestApp/data/model/list_brewerie_model.dart';
import 'package:hdfcTestApp/data/remotedatasource/get_list_breweries_datasource.dart';
import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';

class BreweriesListPresentation {
  LocalWebDatasource localWebDatasource = LocalWebDatasource();
  RemoteDataSource dataSource = RemoteDataSource();
  Future<List<ListBreweriesEntity>> getData() async {
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
