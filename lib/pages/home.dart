import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  
  

  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
  print(data);
  String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
  Color textColor = data['isDayTime'] ? Colors.red[300] : Colors.white;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic result = await Navigator.pushNamed(context, '/location');
           setState(() {
            data = {
              'time' : result['time'],
              'location' : result['location'],
              'flag' : result['flag'],
              'isDayTime' : result['isDayTime'],
            };
          });
        },
        child: Icon(Icons.location_pin),
        backgroundColor: Colors.red[300],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      data['time'],
                        style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 24.0,
                        color: textColor,
                        fontWeight: FontWeight.bold
                      ),

                    ),
                  ),
                ]
                ),
            ),
          ),          
        ],
      )
    );
  }
}