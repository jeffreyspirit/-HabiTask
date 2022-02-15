// Import Packages
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'ResetPassword.dart';

// Define Class A - Stateless
class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: forgotPassword(),
    );
  }
}

// Define Class B - Stateful
class forgotPassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

// Define Class C - Widget
class _forgotPasswordState extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //----------------------------------------------------------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: backToLogin1 ,
        ),
      ),
      //----------------------------------------------------------------
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //----------------------------------------------------------  Spacer & Email Required
            SizedBox(height: 20,),
            Text("Forgot Password", style: TextStyle(
                fontSize: 35
            ),),
            Text("Please enter your Email to receive your password and reset information", style: TextStyle(
                fontSize: 18,
                color: Colors.grey
            ),),
            SizedBox(height: 20,),
            Text("Email", style: TextStyle(
              fontSize: 23,
            ),),
            TextField(
              decoration: InputDecoration(
                  hintText: "jeff@example.com"
              ),
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 40,),
            //----------------------------------------------------------  Reset Button
            Center(
              child: InkWell(
                onTap: openResetPassword,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xfff96060)
                  ),
                  child: Text("Send Request", style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //------------------------------------------------------------------- Navigation function
  void openResetPassword()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
  }
  void backToLogin1()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
}

