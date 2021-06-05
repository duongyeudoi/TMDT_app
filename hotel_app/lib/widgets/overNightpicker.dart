import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverNightPicker extends StatefulWidget {
  static const String idScreen = 'testDay';

  @override
  _OverNightPickerState createState() => _OverNightPickerState();
}

class _OverNightPickerState extends State<OverNightPicker> {
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
      return DateFormat('dd/MM/yyyy')
          .format(dateRange.start.add(Duration(days: 1)));
    }
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
              onTap: () => pickDateRange(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '22:00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    getFrom(),
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
              onTap: () => pickDateRange(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '10:00',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    getUtil(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
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
}
