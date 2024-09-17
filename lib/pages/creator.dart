import 'package:flutter/material.dart';

class Creator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: <Widget>[
                Text(
                  'Created By :',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, 
                  ),
                ),
                SizedBox(height: 16), 

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 60, 
                          backgroundImage: AssetImage('lib/images/people1.png'),
                        ),
                        SizedBox(height: 8),
                        Text('Gerry Hasrom'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 60, 
                          backgroundImage: AssetImage('lib/images/people2.png'),
                        ),
                        SizedBox(height: 8),
                        Text('Muhammad Ihsan'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.green[100],
                  child: Text(
                    'Terima Kasih telah menggunakan aplikasi kami!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
