import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key key}) : super(key: key);

  // Declare a field that holds the Todo.
  final String scores = '9 / 13';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your score',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                scores,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text('Back',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      )),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
