import 'package:flutter/cupertino.dart';
import 'package:weeklyplannerr/database_helper.dart';
import 'constants.dart';
import 'task.dart';

class Tasks extends ChangeNotifier{
  List<Task> tasksSun = [];
  List<Task> tasksMon = [];
  List<Task> tasksTue = [];
  List<Task> tasksWed = [];
  List<Task> tasksThu = [];
  List<Task> tasksFri = [];
  List<Task> tasksSat = [];

  void fillSunTasks(List<Map<String,dynamic>> maps){
    bool isDone;
    for(Map<String,dynamic> map in maps){
      int value = map["${DatabaseHelper.columnISDONE}"];
      if(value==1){
        isDone = true;
      }else{
        isDone = false;
      }
      tasksSun.add(Task(
        taskName: map["${DatabaseHelper.columnNAME}"],
        isDone: isDone,
      ));
    }
  }
  void fillMonTasks(List<Map<String,dynamic>> maps){
    bool isDone;
    for(Map<String,dynamic> map in maps){
      int value = map["${DatabaseHelper.columnISDONE}"];
      if(value==1){
        isDone = true;
      }else{
        isDone = false;
      }
      tasksMon.add(Task(
        taskName: map["${DatabaseHelper.columnNAME}"],
        isDone: isDone,
      ));
    }
  }

  void fillTueTasks(List<Map<String,dynamic>> maps){
    bool isDone;
    for(Map<String,dynamic> map in maps){
      int value = map["${DatabaseHelper.columnISDONE}"];
      if(value==1){
        isDone = true;
      }else{
        isDone = false;
      }
      tasksTue.add(Task(
        taskName: map["${DatabaseHelper.columnNAME}"],
        isDone: isDone,
      ));
    }
  }

  void fillWedTasks(List<Map<String,dynamic>> maps){
    bool isDone;
    for(Map<String,dynamic> map in maps){
      int value = map["${DatabaseHelper.columnISDONE}"];
      if(value==1){
        isDone = true;
      }else{
        isDone = false;
      }
      tasksWed.add(Task(
        taskName: map["${DatabaseHelper.columnNAME}"],
        isDone: isDone,
      ));
    }
  }

  void fillThuTasks(List<Map<String,dynamic>> maps){
    bool isDone;
    for(Map<String,dynamic> map in maps){
      int value = map["${DatabaseHelper.columnISDONE}"];
      if(value==1){
        isDone = true;
      }else{
        isDone = false;
      }
      tasksThu.add(Task(
        taskName: map["${DatabaseHelper.columnNAME}"],
        isDone: isDone,
      ));
    }
  }

  void fillFriTasks(List<Map<String,dynamic>> maps){
    bool isDone;
    for(Map<String,dynamic> map in maps){
      int value = map["${DatabaseHelper.columnISDONE}"];
      if(value==1){
        isDone = true;
      }else{
        isDone = false;
      }
      tasksFri.add(Task(
        taskName: map["${DatabaseHelper.columnNAME}"],
        isDone: isDone,
      ));
    }
  }
  void fillSatTasks(List<Map<String,dynamic>> maps){
    bool isDone;
    for(Map<String,dynamic> map in maps){
      int value = map["${DatabaseHelper.columnISDONE}"];
      if(value==1){
        isDone = true;
      }else{
        isDone = false;
      }
      tasksSat.add(Task(
        taskName: map["${DatabaseHelper.columnNAME}"],
        isDone: isDone,
      ));
    }
  }





  List<Task> returnTaskList(String selectedDay){
    if(selectedDay==days[0]){
      return tasksSun;
    }else if(selectedDay==days[1]){
      return tasksMon;
    }else if(selectedDay==days[2]){
      return tasksTue;
    }else if(selectedDay==days[3]){
      return tasksWed;
    }else if(selectedDay==days[4]){
      return tasksThu;
    }else if(selectedDay==days[5]){
      return tasksFri;
    }else if(selectedDay==days[6]){
      return tasksSat;
    }
  }

  int taskCount(String selectedDay){
    List<Task> list = returnTaskList(selectedDay);
    return list.length;
  }

  void updateTask(Task task){
    task.ToggleDone();
    notifyListeners();
  }

  void deleteTask(String selectedDay , var index){
    List<Task> taskList = returnTaskList(selectedDay);
    taskList.removeAt(index);
    notifyListeners();
  }

  void addNewTask(String selectedDay,Task task){
    List<Task> taskList = returnTaskList(selectedDay);
    taskList.add(task);
    notifyListeners();
  }

  double percentageCalculator(String selectedDay){
    List<Task> taskList = returnTaskList(selectedDay);
    int completedTask = 0;
    int totalTask = taskList.length;
    if(totalTask==0){
    return 0;
    }
    else{
      for(Task task in taskList){
        if(task.isDone){
          completedTask++;
        }
      }
      double perc = double.parse((completedTask/totalTask).toStringAsFixed(2));
      return perc;
    }
  }
}
