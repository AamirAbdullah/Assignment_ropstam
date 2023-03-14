import 'package:assignment_ropstam/res/components/car_component.dart';
import 'package:assignment_ropstam/res/provider/add_car_provider.dart';
import 'package:assignment_ropstam/res/widgets/universal_widget.dart';
import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:assignment_ropstam/view_model/services/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sessionManager = SessionManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.pushNamed(context, RoutesName.addcar,
              arguments: {'edit': false});
        },
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).primaryColorLight,
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          'Cars',
          style: TextStyle(
              fontSize: 26,
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
              onTap: () async {
                await sessionManager.deleteSession().then((value) {
                  Navigator.pushNamed(context, RoutesName.logIn);
                });
              },
              child: Center(
                  child: Icon(
                Icons.logout,
                color: Theme.of(context).primaryColorLight,
              ))),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Consumer<AddCar>(builder: (context, value, _) {
          return value.carsdata.isEmpty
              ? noDataFound(context)
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: value.carsdata.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CarComponent(
                            cars: value.carsdata[index],
                            index: index,
                          );
                          // Text(value.carsdata[index][0].toString());
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          thickness: 2,
                        ),
                      ),
                    ),
                  ],
                );
        }),
      )),
    );
  }
}
