// Import Packages
import 'package:flutter/material.dart';
import 'PasswordChangedSuccessfully.dart';
import 'Forgotpassword.dart';

// Define Class A - Stateless
class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: resetPassword(),
    );
  }
}

// Define Class B - Stateful
class resetPassword extends StatefulWidget {
  @override
  _resetPasswordState createState() => _resetPasswordState();
}

// Define Class C - Widget
class _resetPasswordState extends State<resetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: backToForget1 ,
        ),
      ),
      //----------------------------------------------------------------
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //----------------------------------------------------------  Text
            SizedBox(height: 20,),
            Text("Reset Password", style: TextStyle(
                fontSize: 35
            ),),
            Text("Reset code was sent to your mail Id. Please enter the code and create a new password", style: TextStyle(
                fontSize: 18,
                color: Colors.grey
            ),),
            SizedBox(height: 20,),
            //----------------------------------------------------------  Reset Password
            Text("Reset code", style: TextStyle(
              fontSize: 23,
            ),),
            TextField(
              decoration: InputDecoration(
                  hintText: "****"
              ),
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 40,),
            //----------------------------------------------------------  New Password
            Text("Password", style: TextStyle(
              fontSize: 23,
            ),),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter your new password here"
              ),
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 40,),
            Text("Confirm Password", style: TextStyle(
              fontSize: 23,
            ),),
            TextField(
              decoration: InputDecoration(
                  hintText: "Re-Enter your password here"
              ),
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            //----------------------------------------------------------  Change Password Button
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: openSuccessPage,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Color(0xfff96060)
                    ),
                    child: Text("Change Password", style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  //------------------------------------------------------------------- Navigation function
  void openSuccessPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PasswordChangedSuccessfully()));
  }
  void backToForget1()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
  }
}

