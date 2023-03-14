import 'package:assignment_ropstam/res/provider/add_car_provider.dart';
import 'package:assignment_ropstam/res/widgets/text_field_widget.dart';
import 'package:assignment_ropstam/res/widgets/universal_widget.dart';
import 'package:assignment_ropstam/utils/constants/colors.dart';
import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCars extends StatefulWidget {
  final bool? edit;
  final List<String>? cars;
  final int? index;
  const AddCars({super.key, this.edit, this.cars, this.index});

  @override
  State<AddCars> createState() => _AddCarsState();
}

class _AddCarsState extends State<AddCars> {
  final _formKey = GlobalKey<FormState>();
  List<String> carcategory = ['Truk', 'Sports car'];
  String? selectedCategory;
  String? color;
  String? model;
  String? registrationNo;
  @override
  void initState() {
    if (widget.edit == true) {
      selectedCategory = widget.cars![0].toString();
      color = widget.cars![1].toString();
      model = widget.cars![2].toString();
      registrationNo = widget.cars![3].toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          widget.edit == true ? 'Edit Car' : 'Add Car',
          style: TextStyle(
              fontSize: 26,
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.w700),
        ),
        leading: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.only(right: 20, bottom: 5, top: 5, left: 15),
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColorLight,
              size: 20,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField(
                  alignment: AlignmentDirectional.centerStart,
                  style: TextStyle(color: AppColor().hinttextfeildColor),
                  isExpanded: true,
                  hint: Text(
                    'Please select category',
                    style: TextStyle(
                      color: Theme.of(context).highlightColor.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  value: selectedCategory,
                  dropdownColor: Theme.of(context).primaryColorDark,
                  decoration: dropdowndecoration(
                    passenabledBorder:
                        Theme.of(context).highlightColor.withOpacity(0.3),
                    passfillColor:
                        Theme.of(context).disabledColor.withOpacity(0.2),
                    passcontentpadding: const EdgeInsets.fromLTRB(25, 8, 10, 8),
                    passborderradious: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  onChanged: (var newValue) {
                    selectedCategory = newValue;
                  },
                  validator: (value) =>
                      value == null ? 'Please select category' : null,
                  items: carcategory
                      .map<DropdownMenuItem<String>>(
                          (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                ),
                              ))
                      .toList(),
                  icon: Icon(
                    Icons.arrow_downward,
                    size: 15,
                    color: Theme.of(context).highlightColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyCustomTextField(
                  hintText: 'Enter Color',
                  passinitialValue: color,
                  passenabledBorder:
                      Theme.of(context).highlightColor.withOpacity(0.3),
                  passfillColor:
                      Theme.of(context).disabledColor.withOpacity(0.2),
                  validator: (val) =>
                      val!.isEmpty ? "Please enter color of your car" : null,
                  onChanged: (val) {
                    color = val;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Model',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyCustomTextField(
                  hintText: 'Enter model of car',
                  passinitialValue: model,
                  passenabledBorder:
                      Theme.of(context).highlightColor.withOpacity(0.3),
                  passfillColor:
                      Theme.of(context).disabledColor.withOpacity(0.2),
                  validator: (val) =>
                      val!.isEmpty ? "Please enter model of your car" : null,
                  onChanged: (val) {
                    model = val;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Registration No',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyCustomTextField(
                  hintText: 'Enter registration no',
                  passinitialValue: registrationNo,
                  passenabledBorder:
                      Theme.of(context).highlightColor.withOpacity(0.3),
                  passfillColor:
                      Theme.of(context).disabledColor.withOpacity(0.2),
                  validator: (val) => val!.isEmpty
                      ? "Please enter registration no of your car"
                      : null,
                  onChanged: (val) {
                    registrationNo = val;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Consumer<AddCar>(builder: (context, value, _) {
                  return primaryButtonLoading(
                    context: context,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        if (widget.edit == true) {
                          value.carsdata[widget.index!] = [
                            selectedCategory.toString(),
                            color.toString(),
                            model.toString(),
                            registrationNo.toString()
                          ];
                          Navigator.pushNamed(context, RoutesName.home);
                        } else {
                          value.addCar([
                            selectedCategory.toString(),
                            color.toString(),
                            model.toString(),
                            registrationNo.toString()
                          ]);
                          Navigator.pushNamed(context, RoutesName.home);
                        }
                      }
                    },
                    passButtonText: Text(
                      widget.edit == true ? 'Update' : 'Add Car',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    passButtonColor: Theme.of(context).primaryColorLight,
                    passBorder: Border.all(
                      color: Theme.of(context).primaryColorLight,
                      width: 1.0,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
