import 'dart:convert';

import 'package:hdfcTestApp/data/localdatasource/local_web_datasource.dart';
import 'package:hdfcTestApp/data/model/list_brewerie_model.dart';
import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';
import 'dart:js' as js;

class BreweriesListPresentation {
  LocalWebDatasource localWebDatasource = LocalWebDatasource();

  getData(Function(List<ListBreweriesModel>) list) async {
    final value = localWebDatasource.getCookie("breweries") as String;
    if (value != null && value != "") {
      final jsonValue = json.decode(value);
      final listBrew = List<ListBreweriesModel>.from(
          jsonValue.map((x) => ListBreweriesModel.fromMap(x)));
      list(listBrew);
    } else {
      js.context.callMethod('alertMessage', [
        (f) {
          final jsonValue = json.decode(f);
          final listBrew = List<ListBreweriesModel>.from(
              jsonValue.map((x) => ListBreweriesModel.fromMap(x)));
          list(listBrew);
        }
      ]);
    }
  }
}
