import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_implement_flavor/firebase/dev/firebase_options.dart';

import 'app.dart';
import 'config/app.remote.config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  // ///setup remote config
  AppRemoteConfig.instance.setupRemoteConfig();
  runApp(MyApp());
}


