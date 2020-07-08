class Task{
  final taskName;
  bool isDone;
  Task({this.taskName,this.isDone = false});

  void ToggleDone(){
    isDone=!isDone;
  }
}