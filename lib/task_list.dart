import 'package:flutter/material.dart';
import 'package:weeklyplannerr/constants.dart';
import 'package:weeklyplannerr/database_helper.dart';
import 'add_task.dart';
import 'package:provider/provider.dart';
import 'tasks_data.dart';

class TaskList extends StatelessWidget {
  final selectedDay;
  TaskList({this.selectedDay});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(daysMap[selectedDay], style: TextStyle(color: kYellowTheme, fontSize: 30.0, fontFamily: 'Pacifico'),),
        SizedBox(height: 10.0,),
        Container(
          width: 250.0,
          height: 280.0,
          color: kBackgroundTheme,
          child: Provider.of<Tasks>(context).returnTaskList(selectedDay).isEmpty ?
          Center(child: Text('"No Tasks"',style: TextStyle(fontSize: 30.0,color: Colors.white,fontFamily:'BalsamiqSans' ),),)
              :
          ListView.builder(itemBuilder: (context, index) {
            return
              AddTask(
                task: Provider.of<Tasks>(context).returnTaskList(selectedDay)[index],
                isDone: Provider.of<Tasks>(context).returnTaskList(selectedDay)[index].isDone,
                checkBoxCallBack: (bool checkboxstate) async{
                    int i = await DatabaseHelper.instance.updateByName(
                        Provider.of<Tasks>(context,listen: false).returnTaskList(selectedDay)[index].taskName,
                        Provider.of<Tasks>(context,listen: false).returnTaskList(selectedDay)[index].isDone,
                        selectedDay);
                    print(i);
                    Provider.of<Tasks>(context, listen: false).updateTask(Provider.of<Tasks>(context, listen: false).returnTaskList(selectedDay)[index]);
                    },
                deleteCallBack: () async{
                  int i = await DatabaseHelper.instance.deleteRaw(Provider.of<Tasks>(context, listen: false).returnTaskList(selectedDay)[index].taskName, selectedDay);
                  print(i);
                  Provider.of<Tasks>(context, listen: false).deleteTask(selectedDay, index);
                    },
            );
          },itemCount: Provider.of<Tasks>(context).taskCount(selectedDay),
          ),
        )
      ],
    );
  }
}
