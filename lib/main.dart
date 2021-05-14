import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain qb=QuizBrain();
void main() => runApp(Quizzler());


class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QPage(),
          ),
        ),
      ),
    );
  }
}

class QPage extends StatefulWidget {
  @override
  _QPageState createState() => _QPageState();
}

class _QPageState extends State<QPage> {
  @override
  List<Widget> scorechecker=[];

  void checkAnswer(bool selectedAnswer){
    bool correctAnswer=qb.getQuestionAnswer();
    setState(() {
      if(qb.isFinished()==true)
        {
          Alert(
            context: context,
            title: 'Finished!',
            desc: 'you have reached the end of the quiz!',
          ).show();
          qb.reset();
          scorechecker=[];
        }
      else{
      if(correctAnswer== selectedAnswer ){
        print('user got it right!');
        scorechecker.add(Icon(Icons.check,color: Colors.green,));
      }
      else
      {scorechecker.add(Icon(Icons.close,color: Colors.red,));
        print('user got it wrong!');}
      qb.nextQuestion();
    }
    });
  }
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //Question Area implementation
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              qb.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
          ),
        ),
        //True button implementation
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
        child: FlatButton(
          color: Colors.green,
          child: Text(
            'True',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: (){
           checkAnswer(true);
          },
        ),
        ),
        ),
        Expanded(
          //False button implementation
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
               checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          //checkbox implementation
          children: scorechecker,
        ),
      ],
    );
  }
}
