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
  Color capitalTextColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      body: 
         Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 120.0, 15.0, 0.0),
            child: Column(
              children: <Widget> [
                FlatButton.icon(onPressed: () async {
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
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.red[300],
                  ), 
                label: Text(
                  'Choose location',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: capitalTextColor,
                  ),
                  )),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height:60.0),
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        color: capitalTextColor,
                      ),
                    ),
                  ],
                  ),

                  Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 60.0,
                        color: textColor, 
                      ),
                      ),
              ],
          
            ),
          ),
        ),
    );
  }
}