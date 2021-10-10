import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tomorrow_diary/utils/utils.dart';

import 'widgets.dart';

class TimeSelectWidget extends StatefulWidget {
  TimeSelectWidget({Key? key, required this.text, required this.onChanged})
      : isEnabled = true,
        super(key: key);
  TimeSelectWidget.disable({required this.text}) : isEnabled = false;
  String text;
  String? timeText;
  bool isEnabled;
  void Function(String) onChanged = (String p1) {};
  @override
  State<TimeSelectWidget> createState() => _TimeSelectWidgetState();
}

class _TimeSelectWidgetState extends State<TimeSelectWidget> {
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
  @override
  void initState() {
    super.initState();
  }

  void onTimeChanged(TimeOfDay newTime) {
    _time = newTime;
    setState(() {
      // widget.timeText =
      //     '${_time.period == DayPeriod.am ? '오전' : '오후'} ${_time.hourOfPeriod}:${_time.minute}';
      widget.timeText = '${_time.hour}:${_time.minute}';
      widget.onChanged(widget.timeText ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isEnabled
          ? () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: _time,
                  onChange: onTimeChanged,
                  minuteInterval: MinuteInterval.FIVE,
                  disableHour: false,
                  disableMinute: false,
                  accentColor: TdColor.brown,
                  cancelText: "취소",
                  okText: "완료",
                  blurredBackground: true,
                  okCancelStyle: GoogleFonts.notoSans(
                      color: TdColor.brown, fontWeight: FontWeight.bold),
                ),
              );
            }
          : null,
      child: TextWidget.body(text: widget.timeText ?? widget.text),
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TdSize.radiusM),
        ),
        primary: widget.isEnabled ? TdColor.brown : TdColor.gray,
      ),
    );
  }
}
