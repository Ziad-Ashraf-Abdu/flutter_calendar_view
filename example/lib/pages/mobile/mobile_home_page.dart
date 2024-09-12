import 'package:flutter/material.dart';
import '../day_view_page.dart';
import '../month_view_page.dart';
import '../week_view_page.dart';

class MobileHomePage extends StatefulWidget {
  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  // Track the current view
  Widget _currentView = MonthViewPageDemo();

  // Function to change view
  void _updateView(Widget view) {
    setState(() {
      _currentView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Dark background for the AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.values[1],
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.only(start: 50, end: 12.5)),
                TextButton(
                  onPressed: () => _updateView(MonthViewPageDemo()),
                  child: Text("Month",
                      style: TextStyle(color: Colors.green, fontSize: 25)),
                ),
                TextButton(
                  onPressed: () => _updateView(WeekViewDemo()),
                  child: Text("Week",
                      style: TextStyle(color: Colors.green, fontSize: 25)),
                ),
                TextButton(
                  onPressed: () => _updateView(DayViewPageDemo()),
                  child: Text("Day",
                      style: TextStyle(color: Colors.green, fontSize: 25)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _currentView, // Display the current view
    );
  }
}
