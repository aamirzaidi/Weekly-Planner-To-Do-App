import 'package:flutter/material.dart';
import 'constants.dart';
import 'task.dart';

class AddTask extends StatelessWidget {
  final Task task;
  final Function checkBoxCallBack;
  final isDone;
  final Function deleteCallBack;

  AddTask({this.task, this.checkBoxCallBack,this.isDone,this.deleteCallBack});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundTheme,
      elevation: 4.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
          width: 250.0,
        child: ListTile(
          onLongPress: (){
            return showDialog(
              context: context,
              child: AlertDialog(
                title: Center(child: Text('Delete task?',style: TextStyle(color: Colors.white,fontFamily: 'BalsamiqSans',fontSize: 24.0),)),
                content: Icon(Icons.delete_sweep,color: kYellowTheme.withOpacity(0.8),size: 40.0,),
                backgroundColor: kBackgroundTheme,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(100.0),topRight: Radius.circular(100.0),bottomLeft: Radius.circular(100.0),)),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Yes',style: TextStyle(color: Colors.white,fontSize: 20.0,fontFamily: 'BalsamiqSans'),),
                    onPressed: (){
                      deleteCallBack();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
          leading: Checkbox(
            activeColor: kBackgroundTheme,
            checkColor: kYellowTheme,
            value: isDone,
            onChanged:checkBoxCallBack,
          ),
          title: Text(task.taskName, style: TextStyle(color: kYellowTheme,
          decoration: isDone ? TextDecoration.lineThrough : null,
          ),),
        ),
      ),
    );
  }
}
