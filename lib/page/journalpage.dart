import 'package:flutter/material.dart';
import 'package:hackathon_x_project/page/event_model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class JournalPage extends StatefulWidget {
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
      body: Column(
        children: [
          SizedBox(height: 100),

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
            calendarStyle: CalendarStyle(
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
                      color: emojiPath != null ? Colors.grey[400] : Colors.black,
                      fontWeight: emojiPath != null ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                );
              },
              
                ),
              
            
          ),

          SizedBox(height: 20),

          // Date and details
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 40),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
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
              SizedBox(width: 80),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('dd MMM yyyy').format(_selectedDate),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('EEEE').format(_selectedDate),
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'XXXX', // Customize this or fetch dynamically
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20),

          if (_selectedEvents.isNotEmpty)
            Column(
              children: _selectedEvents.map((eventDetail) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          eventDetail.time,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 1,
                        height: 150,
                        color: Colors.black54,
                      ),
                      SizedBox(width: 20),
                      // Event details for the selected day
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventDetail.description,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 10),
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
    );
  }
}