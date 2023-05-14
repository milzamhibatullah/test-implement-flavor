import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';

class AppRemoteConfig{
  static AppRemoteConfig? _instance;
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  AppRemoteConfig._();
  ///create get instance
  static AppRemoteConfig get instance =>_instance??AppRemoteConfig._();
  Future<FirebaseRemoteConfig> setupRemoteConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 5),
    ));
    await remoteConfig.fetchAndActivate();
    return remoteConfig;
  }

  Future<String> getNameApp()async{
    try{
      String appName = remoteConfig.getString('name_app');
      debugPrint('name from remote config : $appName');
      return Future.value(appName);
    }catch(e){
      debugPrint('error on get name_app : $e');
      throw 'error';
    }
  }
  // Future<String> getMaxMinAge()async{
  //   try{
  //     int minAge = remoteConfig.getInt('min_age');
  //     int maxAge=remoteConfig.getInt('max_age');
  //     Logger.instance.print('maxminage $minAge - $maxAge');
  //     return Future.value('$minAge-$maxAge');
  //   }catch(e){
  //     Logger.instance.print('error get maxminage : $e');
  //     throw 'error';
  //   }
  // }
// Future getLastestVersion() async {
//   try {
//     String version = _remoteConfig.getString('apps_version');
//     ////debugPrint('the version is => $version');
//     return version;
//   } catch (e) {
//     return 'error';
//   }
// }








}