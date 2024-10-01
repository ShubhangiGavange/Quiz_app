import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp_2/view/congratulation_screen.dart';

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});
  @override
  State createState()=> _QuizAppState();
}

class _QuizAppState extends State<QuizApp>{
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int correctAnswerCount = 5;
  List<Map> allQuestions = [
  {
      "question" :"who is founder of microsoft?",
      "options":["steve job","Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer":1
    },
     {
      "question" :"who is founder of Google?",
      "options":["steve job","Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer":2
    },
     {
      "question" :"who is founder of SpaceX?",
      "options":["steve job","Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer":3
    },
     {
      "question" :"who is founder of Apple?",
      "options":["steve job","Bill Gates","Lary Page","Elon Musk"],
      "correctAnswer":0
    },
     {
      "question" :"who is founder of Meta?",
      "options":["steve job","Mark Zukerberg","Lary Page","Elon Musk"],
      "correctAnswer":1
    },
 ];

  WidgetStatePropertyAll<Color?> checkAnswer(int index){
    if(selectedAnswerIndex!=-1){
      if(index==allQuestions[currentQuestionIndex]['correctAnswer']){
        
        return const WidgetStatePropertyAll(Colors.green);
      }else if(selectedAnswerIndex == index){
        correctAnswerCount--;
        return const WidgetStatePropertyAll(Colors.red);
      }else{
        return const WidgetStatePropertyAll(null);
      }
    }else{
      return const WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromRGBO(211,211,211,5),
      appBar:AppBar(
        title: Text("QuizApp",
        style:GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: const Color.fromRGBO(255,255,255,1),
        ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0,70,67,1),
      ),
      body: Column(
        children: [
          const SizedBox(height: 70,),
          Text("${currentQuestionIndex+1} / ${allQuestions.length}",
          style:GoogleFonts.poppins(
            fontSize:20,
            fontWeight: FontWeight.w700,
          ),
          ),
          const SizedBox(height:20),
          Center(
            child: Container(
              width: 383,
              height: 229,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(0,70,67,1), width: 1),
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(255,255,255,1),
              ),
              child:Center(child: Text("${allQuestions[currentQuestionIndex]["question"]}",
              style:GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              )),
            ),
          ),
          const SizedBox(height: 50,),


          // option 1
          ElevatedButton(
            style:ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              minimumSize: const WidgetStatePropertyAll(Size(383, 53)),
              backgroundColor: checkAnswer(0),
            ),
            onPressed: (){
                if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=0;
                  }
                  setState(() {
                    
                  });
            }, 
          child:  Text("A. ${allQuestions[currentQuestionIndex]['options'][0]}",
          style:GoogleFonts.poppins(
            fontSize:20,
            fontWeight:FontWeight.w500,
          ),
          )
          ),
          const SizedBox(height: 20,),


          //option 2
          ElevatedButton(
            style:ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              minimumSize: const WidgetStatePropertyAll(Size(383, 53)),
              backgroundColor: checkAnswer(1),
            ),
            onPressed: (){
              
               if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=1;
                    
                  }
              setState(() {
                
              });
            }, 
          child: Text("B. ${allQuestions[currentQuestionIndex]['options'][1]}",
          style:GoogleFonts.poppins(
            fontSize:20,
            fontWeight:FontWeight.w500,
          ),
          ),
          ),
          const SizedBox(height: 20,),

          //option 3
          ElevatedButton(
            style:ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              minimumSize: const WidgetStatePropertyAll(Size(383, 53)),
              backgroundColor: checkAnswer(2),
            ),
            onPressed: (){
              
                if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=2;
                    
                  }
              setState(() {
                
              });
            }, 
          child: Text("C. ${allQuestions[currentQuestionIndex]['options'][2]}",
          style:GoogleFonts.poppins(
            fontSize:20,
            fontWeight:FontWeight.w500,
          ),
          ),
          ),
          const SizedBox(height: 20,),


          //option 4
          ElevatedButton(
            style:ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              minimumSize: const WidgetStatePropertyAll(Size(383, 53)),
              backgroundColor: checkAnswer(3),
            ),
            onPressed: (){
              if(selectedAnswerIndex==-1){
                    selectedAnswerIndex=3;
                    
                  }
                  setState(() {
                    
                  });
            }, 
          child: Text("D. ${allQuestions[currentQuestionIndex]['options'][3]}",
          style:GoogleFonts.poppins(
            fontSize:20,
            fontWeight:FontWeight.w500,
          ),
          ),
          ),
          const SizedBox(height: 80,),

          // next button
          ElevatedButton(
            style:ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              minimumSize: const WidgetStatePropertyAll(Size(383, 60)),
              backgroundColor:const WidgetStatePropertyAll(Color.fromRGBO(0,70,67,1)),
            ),
            onPressed: (){
            if(selectedAnswerIndex!= -1 && currentQuestionIndex<allQuestions.length-1){
                setState(() {
                currentQuestionIndex++;
                selectedAnswerIndex = -1;
              });
              }
              else if(selectedAnswerIndex != -1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CongratulationScreen(count:correctAnswerCount))).then((_) {
      setState(() {
        currentQuestionIndex = 0;
        correctAnswerCount = 5;
        selectedAnswerIndex = -1;
      });
    });
                
              }else{
ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please Select option'),
                duration: Duration(seconds: 2), 
              ),
            );
              }
              
              
            }, 
          child:  Text("NEXT",
          style:GoogleFonts.poppins(
            fontSize:25,
            fontWeight:FontWeight.w600,
            color:const Color.fromRGBO(255,255,255,1),
          ),
          ),
          ),
          
        ],
      ),
    );
  }
}