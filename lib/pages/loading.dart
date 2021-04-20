import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime () async {

    
    WorldTime instance = WorldTime(location: 'Algiers', flag: 'picture', url: 'Africa/Algiers');

    try{
      await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location, 
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    }
    catch(e){
      String errorApiGet = 'Please wait while we are collecting data';
      
    }
    
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height:300.0),
           SpinKitWave(
                    color: Colors.white,
                    size: 50.0,
            ),
            SizedBox(height:20.0),
            Text(
              'Loading World Times',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
              ),
        ],
      ),
    );
  }
}

