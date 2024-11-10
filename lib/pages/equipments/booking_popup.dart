import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class BookingPopup extends StatefulWidget {
  final String title;

  BookingPopup({required this.title});

  @override
  _BookingPopupState createState() => _BookingPopupState();
}

class _BookingPopupState extends State<BookingPopup> {
  final format = DateFormat("yyyy-MM-dd HH:mm");

  void _showConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          alignment: const Alignment(0, 0),
          children: [
            Container(
              child: Lottie.asset('lib/images/confetti.json'),
            ),
            const AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Booking Confirmed!', style: TextStyle(fontFamily: 'Playfair Display')),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Book Equipment: ${widget.title}', style: TextStyle(fontFamily: 'Playfair Display')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DateTimeField(
            format: format,
            decoration: InputDecoration(labelText: 'Select Date and Time'),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2101),
              );
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showConfirmation();
            },
            child: Text('Confirm Booking', style: TextStyle(fontFamily: 'Playfair Display')),
          ),
        ],
      ),
    );
  }
}
