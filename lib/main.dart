import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'task_screen.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'tasks_data.dart';
import 'database_helper.dart';
import 'loading_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(
        home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: kBackgroundTheme,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: LoadingScreen()),
      ),
    );
  }
}

