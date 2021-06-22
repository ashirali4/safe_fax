import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:safe_fax/components/dialogues/custom.dart';
import 'package:safe_fax/components/loaders/loader.dart';
import 'package:safe_fax/components/toast.dart';
import 'package:safe_fax/models/usermodel.dart';
import 'package:safe_fax/services/firebase/net.dart';
import 'package:safe_fax/widgets/buttons/round_button.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}



class _SignUpState extends State<SignUp> {

  TextEditingController fullname=TextEditingController();
  TextEditingController compnay=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController confirmpassword=TextEditingController();

  Future<void> handleSignUp() async {
     if(password.text==confirmpassword.text){
       showProgressDilogue(context);
       RegistrationUser user=RegistrationUser(fullname.text, compnay.text, email.text, phone.text, username.text, password.text);
       Firebase_Handler firebase_handler=Firebase_Handler();
       var userd=await firebase_handler.register(user);
       Navigator.pop(context);
       if(!userd['error']){
         CustomDialogue("Sign Up Completed",Icons.check_circle,context,SignUpDailogueHandle,'Your Profile has been created you can Login now!','Login Now');
       }
       else{
         showToast("Error in Sign Up");
       }
     }
     else{
       showToast("Password and Confirm password not matched");
     }

  }
  void SignUpDailogueHandle(){
    Navigator.pop(context);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                            height: 130,
                            width: 250,
                            child: Image.asset("assets/logoo.png"))
                      ],
                    ),
                    Center(
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(

                              child: Text('Sign Up',style: GoogleFonts.poppins(
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
                                controller: fullname,
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
                                    hintText: 'Enter your Full Name'),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: compnay,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    prefixIcon: Icon(LineIcons.flag),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black.withOpacity(.2)
                                      ),
                                    ),
                                    fillColor: Colors.grey.withOpacity(.15), filled: true,
                                    hintText: 'Company'),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    prefixIcon: Icon(LineIcons.mailBulk),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black.withOpacity(.2)
                                      ),
                                    ),
                                    fillColor: Colors.grey.withOpacity(.15), filled: true,
                                    hintText: 'Email'),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: phone,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    prefixIcon: Icon(LineIcons.mobilePhone),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black.withOpacity(.2)
                                      ),
                                    ),
                                    fillColor: Colors.grey.withOpacity(.15), filled: true,
                                    hintText: 'Phone No'),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: username,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    prefixIcon: Icon(LineIcons.userCircle),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black.withOpacity(.2)
                                      ),
                                    ),
                                    fillColor: Colors.grey.withOpacity(.15), filled: true,
                                    hintText: 'Enter a Username'),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                obscureText: true,
                                controller: password,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20),
                                    prefixIcon: Icon(LineIcons.key),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black.withOpacity(.2)
                                      ),
                                    ),
                                    fillColor: Colors.grey.withOpacity(.15), filled: true,
                                    hintText: 'Enter a password'),
                              ),
                            ),

                            Container(
                              child: TextFormField(
                                obscureText: true,
                                controller: confirmpassword,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(LineIcons.key),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(08),bottomRight: Radius.circular(08)),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    fillColor: Colors.grey.withOpacity(.15), filled: true,
                                    hintText: 'Confirm Password'),
                              ),
                            ),

                            SizedBox(height: 30,),
                            RoundButton('Sign Up',handleSignUp),
                            SizedBox(height: 20,),
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
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
