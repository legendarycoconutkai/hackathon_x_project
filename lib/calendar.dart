import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  _onDaySelected(selectedDay,focusedDay){
    if (!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,),
      body: content(),
    );
  }
  
  Widget content(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day)=>isSameDay(_selectedDay, day),
              onDaySelected: _onDaySelected,
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2010,10,16),
              lastDay: DateTime.utc(2030,3,14))            
          ),
          SizedBox(height: 30,width: 30),

          Text(
            _focusedDay.toString().split(" ")[0],
            style: TextStyle(fontSize: 20),
            )
        ],
      ),
    );
  }
}