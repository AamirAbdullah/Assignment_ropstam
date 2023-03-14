import 'package:assignment_ropstam/res/provider/add_car_provider.dart';
import 'package:assignment_ropstam/view_model/auth_view_model/login_view_model.dart';
import 'package:assignment_ropstam/view_model/auth_view_model/signup_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => SignUpViewModel()),
  ChangeNotifierProvider(create: (_) => AddCar()),
];
