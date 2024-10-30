// A Flutter widget that represents the journal page of the application.
// 
// This page displays a calendar and a list of events for the selected date.
// Users can select a date from the calendar to view the events for that day.
// 
// The page consists of the following main components:
// - An app bar with a background color.
// - A calendar widget that allows users to select a date.
// - A section displaying the selected date and its details.
// - A list of events for the selected date.
// 
// The calendar widget uses the `TableCalendar` package to display the calendar.
// The events are filtered based on the selected date and displayed in a list.
// 
// The `_JournalPageState` class manages the state of the `JournalPage` widget.
// It handles the selection of dates and updates the list of events accordingly.
// 
// The `EventDetail` class is used to represent the details of an event.
// The `sharedEvents` list contains all the events that are shared across the application.
// 
// The `_updateSelectedEvents` method updates the list of events for the selected date.
// The `_getSelectedDayData` method retrieves the event details for a specific date.
// The `_onDaySelected` method handles the selection of a date from the calendar.
// 
// The `build` method constructs the UI of the journal page, including the calendar,
// selected date details, and the list of events.

import 'package:flutter/material.dart';
import 'package:hackathon_x_project/backend/colour.dart';
import 'package:hackathon_x_project/backend/event_model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  DateTime _selectedDate = DateTime.now();
  List<EventDetail> _selectedEvents = [];
  String? selectedImage;

  @override
  void initState() {
    super.initState();
    _updateSelectedEvents();
  }

  void _updateSelectedEvents() {
    _selectedEvents = sharedEvents.where(
      (e) => isSameDay(e.date, _selectedDate),
    ).toList();

    setState(() {
      selectedImage = _selectedEvents.isNotEmpty ? _selectedEvents.first.emoji : null;
    });
  }

  EventDetail? _getSelectedDayData(DateTime day) {
    return sharedEvents.firstWhere(
      (e) => isSameDay(e.date, day),
      orElse: () => EventDetail(
        date: day,
        title: '',
        time: '',
        description: '',
        emoji: null,
        image: null,
      ),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
    });
    _updateSelectedEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [            
                // Calendar Widget
                TableCalendar(
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2024, 12, 31),
                  focusedDay: _selectedDate,
                  selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
                  onDaySelected: _onDaySelected,
                  calendarFormat: CalendarFormat.week,
                  calendarStyle: const CalendarStyle(
                    outsideDaysVisible: false,
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      EventDetail?  dayData = _getSelectedDayData(day);
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
                            color: emojiPath != null ? Colors.transparent : Colors.black,
                            fontWeight: emojiPath != null ? FontWeight.w700 : FontWeight.w400,
                          ),
                        ),
                      );
                    },
                    
                      ),
                    
                  
                ),
            
                const SizedBox(height: 20),
            
                // Date and details
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 40),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: selectedImage != null
                          ? ClipOval(
                              child: Image.asset(
                                selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 80),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('dd MMM yyyy').format(_selectedDate),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('EEEE').format(_selectedDate),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _getSelectedDayData(_selectedDate)?.title ?? '',
                          style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ],
                ),
            
                const SizedBox(height: 20),
            
                if (_selectedEvents.isNotEmpty)
                  Column(
                    children: _selectedEvents.map((eventDetail) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                eventDetail.time,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              width: 1,
                              height: 150,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 20),
                            // Event details for the selected day
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eventDetail.description,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 10),
                                  if (eventDetail.image != null)
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          eventDetail.image!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
