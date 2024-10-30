import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/event_model.dart';
import 'package:hackathon_x_project/backend/message_to_event.dart';
import 'package:hackathon_x_project/page/journalpage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

// Main widget for the new calendar page
class Newcalendar extends StatefulWidget {
  const Newcalendar({super.key});

  @override
  State<Newcalendar> createState() => _NewcalendarState();
}

class _NewcalendarState extends State<Newcalendar> {
  // Selected day in the calendar
  DateTime _selectedDay = DateTime.now();

  // Retrieve event details for the selected day
  EventDetail? _getSelectedDayData(DateTime selectedDay) {
    for (var event in sharedEvents) {
      if (isSameDay(event.date, selectedDay)) {
        return event;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    // Analyze messages and create events when the widget is initialized
    analyzeMessagesAndCreateEvent(context);
  }

  @override
  Widget build(BuildContext context) {
    // Get event details for the selected day
    EventDetail? selectedDayData = _getSelectedDayData(_selectedDay);
    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  // Calendar icon button to navigate to the JournalPage
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.calendar_month_outlined),
                          color: Colors.black,
                          tooltip: 'Week View',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const JournalPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
              
                  // TableCalendar widget to display the calendar
                  TableCalendar(
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                      });
                    },
                    focusedDay: _selectedDay,
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        EventDetail? dayData = _getSelectedDayData(day);
                        final emojiPath = dayData?.emoji;
              
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: emojiPath != null
                                ? DecorationImage(
                                    image: AssetImage(emojiPath),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            day.day.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: emojiPath != null ? Colors.transparent : Colors.black,
                              fontWeight: emojiPath != null ? FontWeight.w700 : FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              
                  const SizedBox(height: 10),
              
                  // Display event details for the selected day
                  Align(
                    alignment: Alignment.topCenter,
                    child: selectedDayData != null && selectedDayData.description.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: selectedDayData.image != null
                                          ? ClipOval(
                                              child: Image.asset(
                                                selectedDayData.image!,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : selectedDayData.imageFile != null
                                              ? ClipOval(
                                                  child: Image.file(
                                                    File(selectedDayData.imageFile!.path),
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : null,
                                    ),
              
                                    const SizedBox(height: 5),
              
                                    Column(
                                      children: [
                                        Text(
                                          DateFormat('dd MMM').format(_selectedDay),
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          DateFormat('EEEE').format(_selectedDay),
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
              
                                const SizedBox(width: 10),
              
                                Container(
                                  width: 1,
                                  height: 80,
                                  color: Colors.black54,
                                ),
              
                                const SizedBox(width: 10),
              
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          selectedDayData.description,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Center(
                            child: Text(
                              'No events for this day',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
