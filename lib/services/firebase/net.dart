import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_fax/models/usermodel.dart';
class Firebase_Handler{

  final FirebaseAuth _auth = FirebaseAuth.instance;

   Future register(RegistrationUser registrationUser) async {
     var content;
     bool error=true;
    try {
      var user = (await
      _auth.createUserWithEmailAndPassword(
        email: registrationUser.email,
        password: registrationUser.password,
      )
      ).user;
      if (user != null) {
         error=false;
         content=user;
      } else {
        error=true;

      }
    }
    catch(e){
       content=e;
       print(e.toString()+"error");
       error=true;
    }

    return {
      'error':error,
      'content':content
    };
  }

   Future signIn(String username,String password) async {
    var content;
    bool error=true;
    try {
      var user = (await
      _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      )
      ).user;
      if (user != null) {
        error=false;
        content=user;
      } else {
        error=true;

      }
    }
    catch(e){
      content=e;
      print(e.toString()+"error");
      error=true;
    }

    return {
      'error':error,
      'content':content
    };
  }

}