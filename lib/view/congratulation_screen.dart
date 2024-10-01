import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CongratulationScreen extends StatefulWidget {
  final int count;
  const CongratulationScreen({super.key, required this.count});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          const SizedBox(height: 120,),
          Image.asset("lib/assets/congratulation.png"),
          Text("Congratulation",
          style:GoogleFonts.poppins(
            fontSize: 35,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(0,0,0,1),
          ),
          ),
          Text("Score: ${widget.count}/5",
          style:GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(0,0,0,1),
          ),
          ),

          const SizedBox(height: 30,),
           
          ElevatedButton(
            style:ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              minimumSize: const WidgetStatePropertyAll(Size(383, 60)),
              backgroundColor:const WidgetStatePropertyAll(Color.fromRGBO(0,70,67,1)),
            ),
            onPressed: (){
              
              setState(() {
                Navigator.pop(context);
              });
                
              
            }, 
          child:  Text("RETEST",
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