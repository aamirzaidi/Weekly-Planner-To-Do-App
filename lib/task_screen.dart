import 'package:flutter/material.dart';
import 'package:weeklyplannerr/database_helper.dart';
import 'package:weeklyplannerr/day_button.dart';
import 'constants.dart';
import 'day_button.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'task_list.dart';
import 'package:provider/provider.dart';
import 'add_task_sheet.dart';
import 'tasks_data.dart';
import 'task.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  double percentage;
  String selectedDay = 'Su';
  void SelectedDay(var day){
    setState(() {
      selectedDay = day;
    });
  }

  void getDate(){
    var now = DateTime.now();
    if(now.weekday!=null){
      selectedDay = weekdaysMap[now.weekday];
    }
  }


  @override
  void initState() {
    super.initState();

    setState(() {
      getDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) => AddTaskScreen(addTaskCallBack: (var newTask) async{
            Provider.of<Tasks>(context,listen: false).addNewTask(selectedDay,Task(taskName: newTask));
            int i = await DatabaseHelper.instance.insert(
                {
                  DatabaseHelper.columnNAME : "${Provider.of<Tasks>(context, listen: false).returnTaskList(selectedDay)[Provider.of<Tasks>(context, listen: false).taskCount(selectedDay) - 1].taskName}",
                  DatabaseHelper.columnISDONE : Provider.of<Tasks>(context, listen: false).returnTaskList(selectedDay)[Provider.of<Tasks>(context, listen: false).taskCount(selectedDay) - 1].isDone,
                },selectedDay);
            print(i);
          },),isScrollControlled: true);
        },
        mini: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        backgroundColor: kYellowTheme,
        child: Icon(Icons.add, color: kBackgroundTheme,size: 30.0,),
      ),
      backgroundColor: kBackgroundTheme,
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: double.infinity,
              width: 75.0,
              decoration: BoxDecoration(
                color: kYellowTheme,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DayButton(day: days[0],selectedDayCallBack: SelectedDay,selectedDay: selectedDay,),
                  DayButton(day: days[1],selectedDayCallBack: SelectedDay,selectedDay: selectedDay),
                  DayButton(day: days[2],selectedDayCallBack: SelectedDay,selectedDay: selectedDay),
                  DayButton(day: days[3],selectedDayCallBack: SelectedDay,selectedDay: selectedDay),
                  DayButton(day: days[4],selectedDayCallBack: SelectedDay,selectedDay: selectedDay),
                  DayButton(day: days[5],selectedDayCallBack: SelectedDay,selectedDay: selectedDay),
                  DayButton(day: days[6],selectedDayCallBack: SelectedDay,selectedDay: selectedDay),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Weekly Planner',style: TextStyle( color: kYellowTheme, fontSize: 33.0,fontFamily:'Merienda'),),
                    Text('To do List',style: TextStyle( color: kYellowTheme, fontSize: 35.0,fontFamily:'BalsamiqSans'),),
                    SizedBox(
                      height: 50.0,
                    ),
                    CircularPercentIndicator(
                        animation: true,
                        animationDuration: 500,
                        animateFromLastPercent: true,
                        backgroundColor: kBackgroundTheme,
                        lineWidth: 12.0,
                        percent: Provider.of<Tasks>(context).percentageCalculator(selectedDay),
                        center: Text("${(Provider.of<Tasks>(context).percentageCalculator(selectedDay)*100).round()}%\nDone",style: TextStyle(color: kYellowTheme,fontSize: 18.0),),
                        progressColor: kYellowTheme,
                        radius: 150.0),
                    SizedBox(
                      height: 40.0,
                    ),
                    TaskList(selectedDay: selectedDay),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
