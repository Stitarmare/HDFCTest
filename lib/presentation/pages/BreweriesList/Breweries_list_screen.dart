import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hdfcTestApp/domain/entity/list_reweries_entity.dart';
import 'package:hdfcTestApp/presentation/pages/BreweriesList/presentation.dart';
import 'package:hdfcTestApp/presentation/pages/BrewerisDetails/breweries_detail_screen.dart';
import 'package:hdfcTestApp/util/StringClass.dart';

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
    _breweriesListPresentation = BreweriesListPresentation();
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    final value = await _breweriesListPresentation.getData();
    setState(() {
      isLoading = false;
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
                  child: Text(ConstantString.NODATA),
                ))
              : SingleChildScrollView(
                  child: listWidget(),
                ),
    );
  }

  Widget listWidget() {
    return Container(
      child: Column(
        children: listBreweriesEntity
            .map((listBreweriesEntity) => InkWell(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Card(
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 5, bottom: 5, left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                RowWidget(
                                  title: ConstantString.NAME,
                                  value: listBreweriesEntity.name,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RowWidget(
                                  title: ConstantString.TYPE,
                                  value: listBreweriesEntity.breweryType,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RowWidget(
                                  title: ConstantString.CONTACT,
                                  value: getContact(listBreweriesEntity.phone),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RowWidget(
                                  title: ConstantString.ADDRESS,
                                  value:
                                      "${listBreweriesEntity.street}, ${listBreweriesEntity.city}, ${listBreweriesEntity.state}, ${listBreweriesEntity.country}, ${listBreweriesEntity.postalCode}",
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  child: RowWidget(
                                    title: ConstantString.WEBSITEURL,
                                    value: listBreweriesEntity.websiteUrl,
                                  ),
                                  onTap: () {
                                    openLink(listBreweriesEntity.websiteUrl,
                                        listBreweriesEntity.name);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  onTap: () {},
                ))
            .toList(),
      ),
    );
  }

  String getContact(String value) {
    if (value != null && value != "") {
      return value;
    }
    return "NA";
  }

  void openLink(String url, String name) async {
    window.open(url, name);
  }
}
