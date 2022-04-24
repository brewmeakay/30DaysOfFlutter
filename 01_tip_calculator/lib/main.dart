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
  String? _tipResult;
  final TextEditingController _textEditingController = TextEditingController();
  List<bool> _toggleSelections = [true, false, false];

  void _changeToggleButtons(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _toggleSelections.length; i++) {
        if (i == selectedIndex) {
          _toggleSelections[i] = true;
        } else {
          _toggleSelections[i] = false;
        }
      }
    });
  }

  void _calculateValues() {
    final _userAmount = double.parse(_textEditingController.text);
    final _selectedToggleButton =
        _toggleSelections.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.20][_selectedToggleButton];
    final _amount = (_userAmount * tipPercentage).toStringAsFixed(2);
    setState(() {
      _tipResult = _amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODOcalculate the logic of the button

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_tipResult != null)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '€$_tipResult',
                style: const TextStyle(fontSize: 30),
              ),
            ),
          const Text('Total Amount'),
          SizedBox(
            width: 100,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                hintText: '€100.00',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ToggleButtons(
              children: const [
                Text('10%'),
                Text('15%'),
                Text('20%'),
              ],
              isSelected: _toggleSelections,
              onPressed: _changeToggleButtons,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                primary: Colors.green,
                minimumSize: const Size(100, 40),
                shadowColor: Colors.greenAccent,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(30),
                // ),
              ),
              onPressed: _calculateValues,
              child: const Text('Calculate'))
        ],
      ),
    ));
  }
}
