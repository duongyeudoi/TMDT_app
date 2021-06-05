import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class twoHourspicker extends StatefulWidget {
  static const String idScreen = 'test';

  @override
  _twoHourspickerState createState() => _twoHourspickerState();
}

class _twoHourspickerState extends State<twoHourspicker> {
  DateTime nowDate;
  DateTimeRange dateRange;
  String getFrom() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange.start);
    }
  }

  String getUtil() {
    if (dateRange == null) {
      return 'To';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateRange.end);
    }
  }

  String getHour() {
    if (nowDate == null) {
      return '06:00';
    } else
      return DateFormat('HH:mm').format(nowDate);
  }

  String getHourEnd() {
    if (nowDate == null) {
      return '08:00';
    } else
      return DateFormat('HH:mm').format(nowDate.add(Duration(hours: 2)));
  }

  String getDay() {
    if (nowDate == null) {
      return DateFormat('dd/MM/yyyy').format(DateTime.now());
    } else
      return DateFormat('dd/MM/yyyy').format(nowDate);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => pickDateTime(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getHour(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    getDay(),
                  ),
                ],
              ),
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward,
          size: 50.0,
          color: Colors.grey,
        ),
        Container(
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => pickDateTime(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getHourEnd(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    getDay(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;
    final time = await pickTime(context);
    if (time == null) return;
    setState(() {
      nowDate = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
        start: DateTime.now(), end: DateTime.now().add(Duration(hours: 24)));
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: nowDate ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return null;
    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 6, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime:
          nowDate != null ? TimeOfDay(hour: 6, minute: 0) : initialTime,
    );
    if (newTime == null) return null;
    return newTime;
  }
}
