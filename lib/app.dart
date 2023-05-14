import 'package:flutter/material.dart';
import 'package:test_implement_flavor/config/app.remote.config.dart';

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var nameApp = '';

  @override
  void initState() {
    _initialNameApp();
    super.initState();
  }

  _initialNameApp() async {
    ///test to get name from remote config
    await AppRemoteConfig.instance.getNameApp().then((value) {
      debugPrint('name app : $value');
      setState(() {
        nameApp=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: Text(nameApp,style: TextStyle(color: Colors.white,fontSize: 40.0),),),
      ),
    );
  }
}
