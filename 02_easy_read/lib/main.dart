import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _fontSize = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: _fontSize),
              textInputAction: TextInputAction.done,
              minLines: 1,
              maxLines: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slider(
                min: 30,
                max: 400,
                value: _fontSize,
                onChanged: (double newValue) {
                  setState(() {
                    _fontSize = newValue;
                  });
                }),
          ),
        ],
      )),
    );
  }
}


//TODO Create a column and wrap it with safe area
//a textfield and a slider with Mainaxisalignment of spacebetween
//the text field should have a default font size as a variable
//the slider should have the font size as starting point
 