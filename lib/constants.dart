import 'package:flutter/cupertino.dart';

List<String> days = [
  'Su','Mo','Tu','We','Th','Fr','Sa',
];

var daysMap = {
  days[0] : 'SUNDAY' ,  days[1] : 'MONDAY' , days[2] : 'TUESDAY' ,  days[3] : 'WEDNESDAY' ,  days[4] : 'THURSDAY' ,  days[5] : 'FRIDAY',
  days[6] : 'SATURDAY'
};

var weekdaysMap = {
    1 : 'Mo' , 2 : 'Tu' ,  3 : 'We' ,  4 : 'Th' ,  5 : 'Fr',
  6 : 'Sa' ,7 : 'Su'};

const Color kBackgroundTheme = Color(0xFF101820);
const Color kYellowTheme =  Color(0xFFFEE715);
const Color kTaskBox = Color(0xFF67B3FF);

Decoration kDayButtonDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15.0),
  color: kBackgroundTheme,
);