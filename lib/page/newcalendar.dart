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

   ValueNotifier<Map<String ,dynamic>> dateTimeMapNotifier = ValueNotifier({});

  List<Map<String, dynamic>> predefinedEvents = [
    {
      'date': DateTime(2024, 10, 23) ,
      'events': ['happy day hapi'],
      'image':'assets/images/milktea.jpg'
      },
    {
      'date': DateTime(2024, 10, 24) ,
      'events': ['susah sedih'],
      'image':'assets/images/exam.jpg'
      },    
    {
      'date': DateTime(2024, 10, 25) ,
      'events': ['i dontwan go study'],
      'image': 'assets/images/nostudy.jpeg'
      },
    
  ];

  Map<String, dynamic>? _getSelectedDayData (DateTime selectedDay){
    for (var event in predefinedEvents){
      if (isSameDay(event['date'], selectedDay)){
        return event;
      }
    }
    return null;
  }
  

  @override
  void initState() {
        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? selectedDayData = _getSelectedDayData(_selectedDay);
    return Scaffold(
      
      body: Column(
        children: [
          const SizedBox(height: 100),

          TableCalendar(
          headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day)=>isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay){
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              focusedDay: _selectedDay,
              firstDay: DateTime.utc(2010,10,16),
              lastDay: DateTime.utc(2030,3,14),            
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false
              ),

              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context,day,focusedDay){
                  Map<String, dynamic>? dayData = _getSelectedDayData(day);
                  final imagePath = dayData != null ? dayData['image']: null;           
                    return Container(
                      decoration: BoxDecoration(
                        image: imagePath != null
                        ?DecorationImage(image: AssetImage(imagePath),
                        fit: BoxFit.cover
                      )
                      :null,
                    ),
                    alignment: Alignment.center,
                    
                    child: Text(
                      day.day.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                    );
                },
              ),                     
              ),

        const SizedBox(height: 10),

        Expanded(
          child: selectedDayData != null
               ? ListView.builder(
                shrinkWrap: true,
                itemCount: selectedDayData['events'].length,
                itemBuilder: (context, index){
                return Container(
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
                              color: Colors.white
                            ),
                            child: selectedDayData['image'] !=null
                            ? ClipOval(
                              child: Image.asset(
                                selectedDayData['image'],
                                fit: BoxFit.cover,
                              ),
                            )
                            :null,
                            ),

                            

                            const SizedBox(height: 5,),

                            Column(
                              children: [
                                Text(
                                  DateFormat('dd MMM').format(_selectedDay),
                                style: const TextStyle(fontSize: 14),),

                                Text(
                                  DateFormat('EEEE').format(_selectedDay),
                                style: const TextStyle(fontSize: 12),)
                              ],
                            ),
                        ],
                      ),

                      const SizedBox(width: 10,),

                      Container(
                        width: 1,
                        height: 80,
                        color: Colors.black54,
                      ),

                      const SizedBox(width: 10,),

                      Expanded(
                        child: Text(
                              selectedDayData['events'][index].toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,),
                            ),
                          ),
                        ],
                      ),
                    );
                  },             
                )
                : const Center(
                  child: Text(
                    'no events for this day',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
        ),
        ],
      ),
    );
  }
      
}
