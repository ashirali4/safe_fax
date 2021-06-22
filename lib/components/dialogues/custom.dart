import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_fax/widgets/buttons/round_button.dart';

void CustomDialogue(String message,IconData icon,BuildContext context,Function function,[String message2]){

    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 20, left: 60, right: 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Icon(icon,color: Theme.of(context).primaryColor,size: 80,),
                      SizedBox(height: 20,),
                      Text(message,style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                      SizedBox(height: 10,),
                      Text(message2,style: GoogleFonts.poppins(
                        fontSize: 09,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,),
                      Container(
                        width: 200
                        ,
                        height: 75,
                        child: Padding(
                           padding: const EdgeInsets.all(20),
                          child: RoundButton("Login Now",null),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          )
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child
        );
      },
    );

}