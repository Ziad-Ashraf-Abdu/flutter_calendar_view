import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../pages/event_details_page.dart';

class WeekViewWidget extends StatelessWidget {
  final GlobalKey<WeekViewState>? state;
  final double? width;

  const WeekViewWidget({super.key, this.state, this.width});

  @override
  Widget build(BuildContext context) {
    return WeekView(
      backgroundColor: Colors.black87,
      key: state,
      width: width,
      showLiveTimeLineInAllDays: true,
      timeLineWidth: 65,
      liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
        color: Colors.redAccent,
        showTime: true,
      ),
      onEventTap: (events, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(
              event: events.first,
            ),
          ),
        );
      },
      onEventLongTap: (events, date) {
        SnackBar snackBar = SnackBar(content: Text("on LongTap"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
