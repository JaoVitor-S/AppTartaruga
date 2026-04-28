import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calendario(),
  ));
}

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.only(right: 0)),
                Text(
                  "Calendário",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),

                FloatingActionButton(
                  onPressed: null,
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),

                  child: Icon(
                      Icons.settings,
                      size: 25,
                      color: const Color(0xFF1E3050)
                  ),
                )
              ],
            ),
            toolbarHeight: 60,
            centerTitle: true,
            backgroundColor: const Color(0xFF1E3050)
        ),

        body: Column(
          children: [
            TableCalendar(
                rowHeight: 80,
                focusedDay: today,
                firstDay: DateTime(2015, 01, 01),
                lastDay: DateTime(2030, 01, 01))
          ],
        )
    );
  }
}
