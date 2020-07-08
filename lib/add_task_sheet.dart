import 'package:flutter/material.dart';
import 'constants.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack;
  String newTask;
  AddTaskScreen({this.addTaskCallBack});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      color:kBackgroundTheme,
      padding: EdgeInsets.all(30.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Add Task',style: TextStyle(color: kYellowTheme.withOpacity(0.9),fontFamily: 'BalsamiqSans',fontSize: 35.0),),
            Container(
              width: 320.0,
              height: 50.0,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: kYellowTheme),
                  ),
                  style: TextStyle(color: Colors.white,fontSize: 20.0),
                  autofocus: true,
                  cursorColor: kYellowTheme,
                  onChanged: (task){
                    newTask = task;
                  },
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    addTaskCallBack(newTask);
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.check_box,size: 55.0,color: kYellowTheme.withOpacity(0.85),),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
