import 'package:flutter/material.dart';
import 'package:weeklyplannerr/constants.dart';
import 'package:weeklyplannerr/task_screen.dart';
import 'tasks_data.dart';
import 'database_helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:frino_icons/frino_icons.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  launchURL() async {
    const String url = 'https://www.youtube.com/channel/UCqpup921sCCjfTIiYy0CkCw?view_as=subscriber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future getNotes() async{
    List<Map<String,dynamic>> queryRowsS = await DatabaseHelper.instance.queryAll(DatabaseHelper.SuntableName);
    Provider.of<Tasks>(context,listen: false).fillSunTasks(queryRowsS);

    List<Map<String,dynamic>> queryRowsM = await DatabaseHelper.instance.queryAll(DatabaseHelper.MontableName);
    Provider.of<Tasks>(context,listen: false).fillMonTasks(queryRowsM);

    List<Map<String,dynamic>> queryRowsT = await DatabaseHelper.instance.queryAll(DatabaseHelper.TuetableName);
    Provider.of<Tasks>(context,listen: false).fillTueTasks(queryRowsT);

    List<Map<String,dynamic>> queryRowsW = await DatabaseHelper.instance.queryAll(DatabaseHelper.WedtableName);
    Provider.of<Tasks>(context,listen: false).fillWedTasks(queryRowsW);

    List<Map<String,dynamic>> queryRowsTh = await DatabaseHelper.instance.queryAll(DatabaseHelper.ThutableName);
    Provider.of<Tasks>(context,listen: false).fillThuTasks(queryRowsTh);

    List<Map<String,dynamic>> queryRowsF = await DatabaseHelper.instance.queryAll(DatabaseHelper.FritableName);
    Provider.of<Tasks>(context,listen: false).fillFriTasks(queryRowsF);

    List<Map<String,dynamic>> queryRowsSa = await DatabaseHelper.instance.queryAll(DatabaseHelper.SattableName);
    Provider.of<Tasks>(context,listen: false).fillSatTasks(queryRowsSa);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TaskScreen();
    }));
  }
@override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: kBackgroundTheme,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text('Careless Coders',style: TextStyle(color: kYellowTheme,fontFamily: 'BalsamiqSans',fontSize: 30.0),),
        Card(
          elevation: 10.0,
          child: FlatButton(
            color: kBackgroundTheme,
            child: Text('Follow us on youtube',style: TextStyle(color: kYellowTheme,fontFamily: 'BalsamiqSans',fontSize: 20.0),),
            onPressed: (){
            launchURL();
            },
          ),
        ),
        SizedBox(height: 50.0),
        SpinKitPulse(
          color: kYellowTheme,
          size: 100.0,
        ),
        SizedBox(height: 50.0),
        Text('Press back again to exit.',style: TextStyle(color: kYellowTheme,fontFamily: 'BalsamiqSans',fontSize: 20.0),),
      ],
    ),);
  }
}
