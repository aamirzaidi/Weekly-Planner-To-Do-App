import 'package:flutter/material.dart';
import 'constants.dart';

class DayButton extends StatelessWidget {
  final day;
  final selectedDay;
  final Function selectedDayCallBack;
  DayButton({this.day,this.selectedDayCallBack,this.selectedDay});

  Color getCardColour(){
    if(day==selectedDay){
      return kYellowTheme;
    }else{
      return kBackgroundTheme;
    }
  }

  Color getTextColour(){
    if(day==selectedDay){
      return kBackgroundTheme;
    }else{
      return kYellowTheme;
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        selectedDayCallBack(day);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
        elevation: 1.0,
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
        color: getCardColour(),
          ),
          padding: EdgeInsets.all(5.0),
          child: Center(
            child: Text(day, style: TextStyle(color: getTextColour(), fontSize: 25.0,fontWeight: FontWeight.bold,fontFamily: 'BalsamiqSans'),),
          ),
          height: 65.0,
          width: 65.0,
        ),
      ),
    );
  }
}
