import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333A47),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Calendar Timeline',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.tealAccent[100]),
              ),
            ),
            CalendarTimeline(
              dayListHeight: 75,
              initialDate: DateTime(2020, 4, 20),
              firstDate: DateTime(2019, 1, 15),
              lastDate: DateTime(2020, 11, 20),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              selectedSpaceBetweenNameAndNumber: 8,
              unselectedSpaceBetweenNameAndNumber: 8,
              topAndBottomPadding: 8,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
              dayCardSize: const Size(48, 60),
              cardBorderRadius: 16.0,
              unselectedDayNumberTextStyle: const TextStyle(
                color: Color(0xff191F5B),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              unselectedDayNameTextStyle: const TextStyle(
                color: Color(0xffC7C7C7),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              unselectedDayBackgroundColor: Colors.white,
              boxShadow: const BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 3.0,
              ),
              selectedDayNumberTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              selectedDayNameTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              selectedDayBackgroundColor: const Color(0xffFFB06A),
              selectedMonthTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              unselectedMonthTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal[200]),
                ),
                child: Text(
                  'RESET',
                  style: TextStyle(color: Color(0xFF333A47)),
                ),
                onPressed: () => setState(() => _resetSelectedDate()),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Selected date is $_selectedDate',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
