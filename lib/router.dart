import 'package:amazon_clone/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'common/widgets/bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
   case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomBar());
    case CategoryDealsScreen.routeName:
    var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) =>  CategoryDealsScreen(category: category,));
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductScreen());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Text("The screen doesn't exists"),
              ));
  }
}
