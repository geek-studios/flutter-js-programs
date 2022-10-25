import 'calender_overlay.dart';
import 'package:flutter/material.dart';

class BirthdayContainer extends StatefulWidget {
  const BirthdayContainer({Key? key, required this.ondateChange,required this.event})
      : super(key: key);
  final Function(DateTime) ondateChange;
  final String event;
  @override
  State<BirthdayContainer> createState() => _BirthdayContainerState();
}

class _BirthdayContainerState extends State<BirthdayContainer> {
  DateTime? time;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        late OverlayEntry calenderOvelay;
        calenderOvelay = OverlayEntry(
          builder: (context) => CalenderOverlay(
              onDateChanged: (newTime) {
                setState(() {
                  time = newTime;
                });
                widget.ondateChange(newTime);
                calenderOvelay.remove();
              },
              calenderOverlay: calenderOvelay),
        );
        Overlay.of(context)?.insert(calenderOvelay);
      },
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 16 * 2),
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey.shade100,
        ),
        child: Row(children: [
          Icon(
            Icons.calendar_today,
            size: 30,
            color: primaryBlue,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            time == null
                ? widget.evet
                : "${time!.day}-${time!.month}-${time!.year}",
            style: TextStyle(
              fontSize: 18,
              color: time == null ? Colors.grey.shade400 : Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
