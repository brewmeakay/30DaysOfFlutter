import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'widgets/cards.dart';
import 'service/question_bank.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: const HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void previousButton() {
    setState(() {
      _currentIndex - 1 >= 0
          ? _currentIndex--
          : (_currentIndex = listOfQuestions.length - 1);
    });
  }

  void nextButton() {
    setState(() {
      (_currentIndex + 1 < listOfQuestions.length)
          ? _currentIndex++
          : _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Language Flashcards')),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: FlipCard(
                  front: FlashCardsView(
                    text: 'German: ${listOfQuestions[_currentIndex].frontSide}',
                  ),
                  back: FlashCardsView(
                    text: 'English: ${listOfQuestions[_currentIndex].backSide}',
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    onPressed: previousButton,
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Prev'),
                      ],
                    )),
                OutlinedButton(
                  onPressed: nextButton,
                  child: Row(
                    children: const [
                      Text('Next'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
