import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../extension.dart';
import 'create_event_page.dart';

class DetailsPage extends StatelessWidget {
  final CalendarEventData event;

  const DetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: event.color,
        elevation: 0,
        centerTitle: false,
        title: Text(
          event.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: event.color.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(
            Icons.arrow_back,
            color: event.color.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Text(
            "Date: ${event.date.dateToStringWithFormat(format: "dd/MM/yyyy")}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 15.0,
          ),
          if (event.startTime != null && event.endTime != null) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("From",
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(
                        event.startTime
                                ?.getTimeInFormat(TimeStampFormat.parse_12) ??
                            "",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("To", style: Theme.of(context).textTheme.bodyLarge),
                      Text(
                        event.endTime
                                ?.getTimeInFormat(TimeStampFormat.parse_12) ??
                            "",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
          if (event.description?.isNotEmpty ?? false) ...[
            Divider(),
            Text("Description", style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(
              height: 10.0,
            ),
            Text(event.description!,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
          const SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    CalendarControllerProvider.of(context)
                        .controller
                        .remove(event);
                    Navigator.of(context).pop();
                  },
                  child: Text('Delete Event'),
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CreateEventPage(
                          event: event,
                        ),
                      ),
                    );

                    if (result) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Edit Event'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
