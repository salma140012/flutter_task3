import 'package:flutter/material.dart';
import 'package:h/quiz_model/quiz.dart';


class QuestionScreen extends StatefulWidget {
  int index;
  QuestionScreen(this.index);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  Quiz quiz = Quiz();
  bool isCorrect = false;
  bool isWrong = false;
Color color1=Colors.white;
Color color2=Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              quiz.questions[widget.index].question,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0
              ),
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    child: Container(
                      width: 150.0,
                      height: 70.0,
                      decoration: BoxDecoration(

                      //  color: color1,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          width: 5.0,
                          // assign the color to the border color
                          color: color1,
                        ),




                      ),
                      child: Center(child:Text('True',style: TextStyle(fontSize: 20.0),)),
                    ),
                    onPressed: () {
                      if(quiz.questions[widget.index].answer == true){
                        setState(() {
                          isCorrect = true;
                          isWrong = false;
                          color1=Colors.green;


                        });
                      }
                      else {
                        setState(() {
                          isCorrect = false;
                          isWrong = true;
                          color1=Colors.red ;
                        });
                      }
                    }
                ),
                MaterialButton(
                    child: Container(
                      width: 150.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                       // color: color2,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          width: 5.0,
                          // assign the color to the border color
                          color: color2,
                        ),

                      ),
                      child: Center(child:Text('False',style: TextStyle(fontSize: 20.0),)),
                    ),
                    onPressed: () {
                      if(quiz.questions[widget.index].answer == true){
                        setState(() {
                          isCorrect = false;
                          isWrong = true;
                         color2=Colors.red ;
                        });
                      }
                      else {
                        setState(() {
                          isCorrect = true;
                          isWrong = false;
                          color2=Colors.green;
                        });
                      }
                    }
                )//,
              ],
            ),
            MaterialButton(
              child: Container(
                width: 200.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(child:Text('Next',style: TextStyle(fontSize: 20.0),)),
              ),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionScreen(widget.index +1),
                ),
              ),
            )//,
          ],
        ),
      ),

    );

  }
}



