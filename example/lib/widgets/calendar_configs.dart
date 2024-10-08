import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../enumerations.dart';
import '../extension.dart';
import 'add_event_form.dart';

class CalendarConfig extends StatelessWidget {
  final void Function(CalendarView view) onViewChange;
  final CalendarView currentView;

  const CalendarConfig({
    super.key,
    required this.onViewChange,
    this.currentView = CalendarView.month,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 20, top: 20)),
        Divider(
          color: AppColors.coolGrey,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Active View:",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: AppColors.greenText,
                  ),
                ),
                Wrap(
                  children: List.generate(
                    CalendarView.values.length,
                    (index) {
                      final view = CalendarView.values[index];
                      return GestureDetector(
                        onTap: () => onViewChange(view),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 40,
                          ),
                          margin: EdgeInsets.only(
                            right: 20,
                            top: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: view == currentView
                                ? AppColors.navy
                                : AppColors.coolGrey,
                          ),
                          child: Text(
                            view.name.capitalized,
                            style: TextStyle(
                              color: view == currentView
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Add Event: ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: AppColors.greenText,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AddOrEditEventForm(
                  onEventAdd: (event) {
                    CalendarControllerProvider.of(context)
                        .controller
                        .add(event);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
