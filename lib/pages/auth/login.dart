import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:safe_fax/components/loaders/loader.dart';
import 'package:safe_fax/services/firebase/net.dart';
import 'package:safe_fax/widgets/buttons/round_button.dart';

import '../../components/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obsecuretext=true;
  TextEditingController username=new TextEditingController();
  TextEditingController password=new TextEditingController();



  Future<void> signIn() async {
    if(username.text==''){
      showToast('Email can\'t be Empty!');

    }
    else if(password.text==''){
      showToast('Password  can\'t be Empty!');
    }
    else{
      showProgressDilogue(context);
      Firebase_Handler firebase_handler=Firebase_Handler();
      var user=await firebase_handler.signIn(username.text, password.text);
      if(!user["error"]){
        showToast('Logged In Successfully');
      }
      else{
        showToast('Error in Login');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Container(
                        height: 130,
                        width: 250,
                        child: Image.asset("assets/logoo.png"))
                  ],
                ),
              ),
             Expanded(
               flex: 8,
               child: SingleChildScrollView(
                 child: Form(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Container(
                         child: Text('Login',style: GoogleFonts.poppins(
                           fontSize: 28,
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                         ),
                         textAlign: TextAlign.start,),
                         width: MediaQuery.of(context).size.width,
                       ),
                       SizedBox(height: 10,),
                       Container(
                         child: TextFormField(
                           controller: username,
                           keyboardType: TextInputType.emailAddress,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.all(20),
                               prefixIcon: Icon(LineIcons.userAlt),
                               border: UnderlineInputBorder(
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(08),topRight: Radius.circular(08)),
                                 borderSide: BorderSide(
                                     width: 1,
                                     color: Colors.black.withOpacity(.2)
                                 ),
                               ),
                               fillColor: Colors.grey.withOpacity(.15), filled: true,
                               hintText: 'Enter your email'),
                         ),
                       ),
                       Container(
                         child: TextFormField(
                           controller: password,
                           obscureText: obsecuretext,
                           decoration: InputDecoration(
                               prefixIcon: Icon(LineIcons.key),
                               suffixIcon: InkWell(
                                   onTap: (){
                                     setState(() {
                                       obsecuretext=!obsecuretext;
                                     });
                                   },
                                   child: Icon(LineIcons.eye)),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(08),bottomRight: Radius.circular(08)),
                                 borderSide: BorderSide(
                                   width: 0,
                                   style: BorderStyle.none,
                                 ),
                               ),
                               fillColor: Colors.grey.withOpacity(.15), filled: true,
                               hintText: '*******'),
                         ),
                       ),
                       SizedBox(height: 10,),
                       Container(
                         width: MediaQuery.of(context).size.width,
                         child: Text('Forgotten Password?',
                           textAlign: TextAlign.end,
                           style: GoogleFonts.poppins(
                             fontSize: 12,
                             color: Colors.black54,
                             fontWeight: FontWeight.w500
                         ),),
                       ),
                       SizedBox(height: 40,),
                       RoundButton('Login',signIn),
                       SizedBox(height: 40,),
                       Container(
                         width: MediaQuery.of(context).size.width,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Don\'t have an account?',
                               textAlign: TextAlign.center,
                               style: GoogleFonts.poppins(
                                   fontSize: 11,
                                   color: Colors.black54,
                                   fontWeight: FontWeight.w500
                               ),),
                             InkWell(
                               onTap: (){
                                 Navigator.pushNamed(context, "signup");
                               },
                               child: Text(' Create One',
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.poppins(
                                     fontSize: 11,
                                     color: Theme.of(context).primaryColor,
                                     fontWeight: FontWeight.w500
                                 ),),
                             ),

                           ],
                         ),

                       ),
                       Text('Or Continue without Account?',
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(
                             fontSize: 11,
                             color: Colors.black54,
                             fontWeight: FontWeight.w500
                         ),),
                     ],
                   ),
                 ),
               ),
             ),

            ],
          ),
        ),
      ),
    ));
  }
}
