import 'package:flutter/material.dart';
import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';
import 'package:hdfcTestApp/presentation/pages/BreweriesList/presentation.dart';

class BreweriesListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateBreweriesListScreen();
  }
}

class _StateBreweriesListScreen extends State<BreweriesListScreen> {
  BreweriesListPresentation _breweriesListPresentation;
  bool isLoading = false;
  List<ListBreweriesEntity> listBreweriesEntity;
  @override
  void initState() {
    // TODO: implement initState

    _breweriesListPresentation = BreweriesListPresentation();
    getData();
    super.initState();
  }

  getData() async {
    final value = await _breweriesListPresentation.getData();
    setState(() {
      listBreweriesEntity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brewerie"),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : listBreweriesEntity == null
              ? Container(
                  child: Center(
                  child: Text("No data Found!"),
                ))
              : SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: listBreweriesEntity
                          .map((e) => Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 40, bottom: 40, left: 20),
                                        child: Text(e.name),
                                      ),
                                    ),
                                  ))
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ),
    );
  }
}
