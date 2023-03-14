import 'package:assignment_ropstam/res/provider/add_car_provider.dart';
import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarComponent extends StatelessWidget {
  final List<String> cars;
  final int index;
  const CarComponent({super.key, required this.cars, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0.2, 0.2),
              color: Theme.of(context).primaryColorDark.withOpacity(0.4),
              blurRadius: 25,
              blurStyle: BlurStyle.inner),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: screenSize.width - 60,
      height: 60,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cars[0].toString(),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              Row(
                children: [
                  Text(
                    cars[1].toString(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, RoutesName.addcar,
                          arguments: {
                            'edit': true,
                            'cars': cars,
                            'index': index
                          });
                    }),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 4, 5),
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cars[2].toString(),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              Consumer<AddCar>(builder: (context, value, _) {
                return Row(
                  children: [
                    Text(
                      cars[3].toString(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    InkWell(
                      onTap: (() {
                        value.carsdata.removeAt(index);
                        value.deletecheck(true);
                      }),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 2, 4, 5),
                        child: Icon(
                          Icons.delete,
                          size: 20,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
