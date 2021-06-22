import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class Profile_Widget extends StatefulWidget {
  // const Profile_Widget({Key? key}) : super(key: key);

  @override
  _Profile_WidgetState createState() => _Profile_WidgetState();
}

class _Profile_WidgetState extends State<Profile_Widget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Column(
            children: [
              this._renderTopWidget(),
              this._renderProfileSection(),
              this._renderOptionSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTopWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Profile',
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          flex: 1,
        ),
        Expanded(
          flex: 1,
          child: Container(
              height: 45, width: 45, child: Image.asset("assets/logoonly.png")),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.wb_sunny_outlined)],
          ),
          flex: 1,
        )
      ],
    );
  }

  Widget _renderProfileSection() {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
          width: 130.0,
          height: 130.0,
          padding: EdgeInsets.all(20),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
            border: new Border.all(
              color: Theme.of(context).primaryColor,
              width: 4.0,
            ),
          ),
          child: Center(
              child: Icon(
            LineIcons.user,
            size: 80,
            color: Colors.grey,
          )),
        ),
        SizedBox(height: 08,),
        Text(
          'Ashir Ali',
          style: GoogleFonts.poppins(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 03,),
        Text(
          'muhammadashirali4@gmail.com',
          style: GoogleFonts.poppins(
              fontSize: 13, color: Colors.black, ),
        ),
      ],
    );
  }

  Widget _renderOptionSection(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 05,),
          Divider(color: Colors.black45,),
          SizedBox(height: 05,),
          this._renderOptionWidget('Sent Faxes',Icons.login_outlined,null),
          this._renderOptionWidget('Add Credits',Icons.monetization_on_outlined,null),
          this._renderOptionWidget('Billing',Icons.credit_card_outlined,null),
          this._renderOptionWidget('Account Info',Icons.work_outline,null),
          this._renderOptionWidget('Support',LineIcons.weixinWechat,null),

        ],
      ),
    );
  }

  Widget _renderOptionWidget(String text,IconData icon, Function function){
     return Column(
       children: [
         SizedBox(height: 10,),
         Row(
           children: [
             Expanded(child: Row(
               children: [
                 Icon(icon)
               ],
               mainAxisAlignment: MainAxisAlignment.start,
             ),flex: 1,),
             Expanded(child: Text(text,style: GoogleFonts.poppins(fontSize: 16),),flex: 3,),
             Expanded(child: Row(
               children: [
                 Icon(Icons.arrow_forward_ios_rounded,size: 18,)
               ],
               mainAxisAlignment: MainAxisAlignment.end,
             ),flex: 1,),

           ],
         ),
         SizedBox(height: 10,),
         Divider(color: Colors.black45.withOpacity(.4),),

       ],
     );
  }
}
