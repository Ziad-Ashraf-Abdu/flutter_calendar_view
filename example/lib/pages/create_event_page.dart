import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../widgets/add_event_form.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key, this.event});

  final CalendarEventData? event;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: false,
        leading: IconButton(
          onPressed: () =>
              Navigator.of(context).pop(), // Use Navigator's pop method
          icon: Icon(
            Icons.arrow_back,
            color: theme.iconTheme.color,
          ),
        ),
        title: Text(
          event == null ? "Create New Event" : "Update Event",
          style: theme.textTheme.titleLarge!.copyWith(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AddOrEditEventForm(
            onEventAdd: (newEvent) {
              if (this.event != null) {
                CalendarControllerProvider.of(context)
                    .controller
                    .update(this.event!, newEvent);
              } else {
                CalendarControllerProvider.of(context).controller.add(newEvent);
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CalendarControllerProvider(
                    controller:
                        EventController(), // Provide the EventController here
                    child: CreateEventPage(),
                  ),
                ),
              );
              Navigator.of(context)
                  .pop(true); // Use Navigator's pop method with a value
            },
            event: event,
          ),
        ),
      ),
    );
  }
}
