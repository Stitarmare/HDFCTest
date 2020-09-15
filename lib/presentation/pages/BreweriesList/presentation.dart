import 'dart:convert';

import 'package:hdfcTestApp/data/model/list_brewerie_model.dart';
import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';
import 'dart:js' as js;

class BreweriesListPresentation {
  getData(Function(List<ListBreweriesModel>) list) async {
    js.context.callMethod('checkBroweserComapatiblity', [
      (data) {
        if (data != null) {
          final jsonValue = json.decode(data);
          final listBrew = List<ListBreweriesModel>.from(
              jsonValue.map((x) => ListBreweriesModel.fromMap(x)));
          list(listBrew);
        } else {
          list(null);
        }
      }
    ]);
  }
}
