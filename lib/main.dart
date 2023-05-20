import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  return runApp(TimeClockCalendar());
}

/// The app which hosts the home page
class TimeClockCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Calendar', debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

/// The home page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates home page
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Text('Add'),
          onPressed: () {
            var _controller;
            final Appointment app = Appointment(
                startTime: _controller.displayDate!,
                endTime:
                _controller.displayDate!.add(const Duration(hours: 2)),
                subject: 'Add Appointment',
                color: Colors.pink);
            var _events;
            _events?.appointments!.add(app);
            _events?.notifyListeners(
                CalendarDataSourceAction.add, <Appointment>[app]);
          },
        ),
        body: Container(
          child: SfCalendar(
            view: CalendarView.week,
            initialDisplayDate: DateTime(2022, 05, 12, 8, 00),
            todayHighlightColor: Colors.red,
            showCurrentTimeIndicator: true,
            showNavigationArrow: true,
            cellBorderColor: Colors.blue,
            dataSource: _getCalendarDataSource(),
          ),
        ),

      ),
    );
  }
  }}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}

class Meeting {
  Meeting({this.eventName = '',
    required this.from,
    required this.to,
    required this.background,
    this.isAllDay = false,


  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

}
