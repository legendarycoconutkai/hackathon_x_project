import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Newcalendar extends StatefulWidget {
  const Newcalendar({super.key});

  @override
  State<Newcalendar> createState() => _NewcalendarState();
}

class _NewcalendarState extends State<Newcalendar> {


DateTime _selectedDay = DateTime.now();

   ValueNotifier<Map<DateTime,List<dynamic>>> dateTimeMapNotifier = ValueNotifier({});

  List<Map<DateTime, List<String>>> predefinedArray = [
    {DateTime(2024,10,23): ['happy day hapi']},
    {DateTime(2024,10,24): ['susah sedih']},
    {DateTime(2024,10,25):['i dontwan go study']},
  ];

   DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void updateMapWithPredefinedArray(){
    Map<DateTime, List<dynamic>> newMap = {};

    for (var entry in predefinedArray){
      entry.forEach((key,value){
        DateTime normalizedKey = _normalizeDate(key);
        newMap[normalizedKey] = value;
      });
      
    }

    dateTimeMapNotifier.value= newMap;
  }
  

  @override
  void initState() {
        super.initState();
        updateMapWithPredefinedArray();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          SizedBox(height: 100),

          TableCalendar(
          headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day)=>isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay){
                setState(() {
                  _selectedDay = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
                });
              },
              focusedDay: _selectedDay,
              firstDay: DateTime.utc(2010,10,16),
              lastDay: DateTime.utc(2030,3,14),
              eventLoader: (day) {
                DateTime normalizedDay = _normalizeDate(day);
                var events = dateTimeMapNotifier.value[normalizedDay] ?? [];
                print('events for $normalizedDay: $events');
                return events;
              },
              calendarStyle: CalendarStyle(
                markerDecoration: BoxDecoration(
                  color: Colors.grey[350],
                  shape: BoxShape.circle
                ),
                markersMaxCount: 1,
                markerSizeScale: 0.3,
                outsideDaysVisible: false
              ),                     
              ),

        SizedBox(height: 10),

        Expanded(
          child: ValueListenableBuilder<Map<DateTime, List<dynamic>>>(
            valueListenable: dateTimeMapNotifier, 
            builder: (context, value, child){
              List<dynamic> selectedEvents = value[_selectedDay] ?? [];
              return ListView.builder(
                shrinkWrap: true,
                itemCount: selectedEvents.length,
                itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding: EdgeInsets.all(20),
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
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),),

                            const SizedBox(height: 5,),

                            Column(
                              children: [
                                Text(
                                  DateFormat('dd MMM').format(_selectedDay),
                                style: TextStyle(fontSize: 14),),

                                Text(
                                  DateFormat('EEEE').format(_selectedDay),
                                style: TextStyle(fontSize: 12),)
                              ],
                            ),
                        ],
                      ),

                      SizedBox(width: 10,),

                      Container(
                        width: 1,
                        height: 80,
                        color: Colors.black54,
                      ),

                      SizedBox(width: 10,),

                      Expanded(
                        child: Text(
                              selectedEvents[index].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,),
                            ),
                          ),
                        ],
                      ),
                    );
                  },             
                );
              },
            ),
        )
        ]
      )
        );
       

  }
}