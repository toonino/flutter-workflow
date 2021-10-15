import 'package:flutter/material.dart';
import 'package:practice6_workflow/routes/routes.dart';
import 'package:practice6_workflow/screen/contract/contract.dart';
import 'package:practice6_workflow/screen/merchant/listMerchant.dart';
import 'package:practice6_workflow/screen/overview/overview.dart';
import 'package:practice6_workflow/screen/work/work.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

void main() => runApp(Workflow());

class Workflow extends StatefulWidget {
  @override
  _WorkflowState createState() => _WorkflowState();
}

class _WorkflowState extends State<Workflow> {
  int _index = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Overview(),
            Work(),
            listMerchant(),
            Contract(),
          ],
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 16,
            selectedIconTheme: IconThemeData(color: Colors.blue[700], size: 30),
            selectedItemColor: Colors.blue[700],
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedIconTheme: IconThemeData(
              color: Colors.grey,
            ),
            onTap: onTabTapped,
            currentIndex: _index,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.leaderboard,
                ),
                title: Text(
                  'Tổng quan',
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_today,
                ),
                title: Text(
                  'Công việc',
                ),
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.perm_contact_calendar_rounded,
                ),
                backgroundColor: Colors.white,
                title: Text(
                  'Merchant',
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.assignment,
                ),
                title: Text(
                  'Hợp đồng',
                ),
                backgroundColor: Colors.white,
              ),
            ]),
      ),
      initialRoute: '/',
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _index = page;
    });
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
