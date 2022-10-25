import 'package:flutter/material.dart';

class CalenderOverlay extends StatelessWidget {
  final Function(DateTime) onDateChanged;
  final OverlayEntry calenderOverlay;
  const CalenderOverlay(
      {Key? key, required this.onDateChanged, required this.calenderOverlay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Material(
        color: Colors.black.withOpacity(.1),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => calenderOverlay.remove(),
              child: Container(
                color: Colors.black.withOpacity(.4),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
              ),
            ),
            Center(
              child: Container(
                height: 370,
                width: MediaQuery.of(context).size.width - 16 * 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    onDateChanged: onDateChanged),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
