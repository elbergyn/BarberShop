import 'package:flutter/material.dart';

import 'package:barbershop/src/core/ui/constants.dart';

class HoursPanel extends StatelessWidget {
  final int startTime;
  final int endTime;
  final ValueChanged<int> onHoursPressed;

  const HoursPanel({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.onHoursPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecione os horários de atendimento',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 16,
            children: [
              for (int i = startTime; i <= endTime; i++)
                TimeButton(
                  label: '${i.toString().padLeft(2, '0')}:00',
                  value: i,
                  onPressed: onHoursPressed,
                )
            ],
          )
        ],
      ),
    );
  }
}

class TimeButton extends StatefulWidget {
  final String label;
  final int value;
  final ValueChanged<int> onPressed;

  const TimeButton(
      {super.key,
      required this.label,
      required this.value,
      required this.onPressed});

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorsConstants.grey;
    var buttonColor = selected ? ColorsConstants.brow : Colors.white;
    final buttonBorderColor =
        selected ? ColorsConstants.brow : ColorsConstants.grey;

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        setState(() {
          selected = !selected;
          widget.onPressed(widget.value);
        });
      },
      child: Container(
        width: 64,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          border: Border.all(
            color: buttonBorderColor,
          ),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500, color: textColor),
          ),
        ),
      ),
    );
  }
}
