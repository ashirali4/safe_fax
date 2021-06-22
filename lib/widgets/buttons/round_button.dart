import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  String button_name;
  Function fucntion;
  RoundButton(this.button_name,this.fucntion);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      width: 250,
      child: ElevatedButton(
          child: Text(
              button_name.toUpperCase(),
              style: GoogleFonts.poppins(fontSize: 14)
          ),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFf88c02)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      side: BorderSide(color: Theme.of(context).primaryColor)
                  )
              )
          ),
          onPressed: () {
            fucntion();
          }
      ),
    );
  }
}
