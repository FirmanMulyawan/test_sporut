import 'package:firman_dot/features/sqflite/add_expense/binding/add_expense_binding.dart';
import 'package:firman_dot/features/sqflite/add_expense/presentation/add_expense_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../features/sqflite/home/binding/home_binding.dart';
import '../../features/sqflite/home/presentation/home_screen.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String notFound = '/notFound';
  static const String home = '/home';
  static const String addExpense = '/add-expense';

  static List<GetPage> pages = [
    GetPage(
      name: defaultRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: addExpense,
      page: () => const AddExpenseScreen(),
      binding: AddExpenseBinding(),
    ),
  ];
}
