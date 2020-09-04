import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hdfcTestApp/injection_container.dart';
import 'package:hdfcTestApp/presentation/bloc/getbrewerie_bloc.dart';

class BreweriesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("List"),
        ),
        body: SingleChildScrollView(
          child: buildBody(context),
        ),
      ),
    );
  }

  BlocProvider<GetbrewerieBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final da = sl<GetbrewerieBloc>();
        //da.add(GetBrewerieList());
        return da;
      },
      child: BlocBuilder<GetbrewerieBloc, GetbrewerieState>(
          builder: (bloc, state) {
        BlocProvider.of<GetbrewerieBloc>(bloc).add(GetBrewerieList());
        if (state is Empty) {
          return Container(
            child: Center(
              child: Text("Empty"),
            ),
          );
        }
        if (state is Loading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is Loaded) {
          return Column(
            children: state.listBreweriesEntity
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
          );
        }
        if (state is Error) {
          return Container(
            child: Center(
              child: Text(state.message),
            ),
          );
        }
        return Container();
      }),
    );
  }

  Future<bool> _onWillPop() async {
    sl.resetLazySingleton<GetbrewerieBloc>();

    return true;
  }
}
