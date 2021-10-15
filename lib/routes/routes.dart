import 'package:flutter/material.dart';
import 'package:practice6_workflow/screen/contract/contract.dart';
import 'package:practice6_workflow/screen/merchant/detailMerchant.dart';
import 'package:practice6_workflow/screen/merchant/listMerchant.dart';
import 'package:practice6_workflow/screen/overview/overview.dart';
import 'package:practice6_workflow/screen/work/work.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Overview());
        break;
      case '/work':
        return MaterialPageRoute(builder: (context) => Work());
        break;
      case '/listMerchant':
        return MaterialPageRoute(builder: (context) => listMerchant());
      case '/detailMerchant':
        return MaterialPageRoute(builder: (context) => detailMerchant());
        break;
      case '/contract':
        return MaterialPageRoute(builder: (context) => Contract());
        break;
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(title: Text("Not data")),
                ));
    }
  }
}
