// Import Packages
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Onboarding.dart';
import 'Forgotpassword.dart';

// Define Class A - Stateless
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: loginPage(),
    );
  }
}

// Define Class B - Stateful
class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

// Define Class C - Widget
class _loginPageState extends State<loginPage> {
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
          onPressed: backToOnboard,
        ),
      ),
      //----------------------------------------------------------------
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //---------------------------------------------------------- Text & Spacer
            SizedBox(height: 20,),
            Text("Welcome Back!", style: TextStyle(
              fontSize: 35
            ),),
            Text("Sign in to continue...", style: TextStyle(
                fontSize: 18,
              color: Colors.grey
            ),),
            SizedBox(height: 20,),
            //---------------------------------------------------------- Text & User name
            Text("User Name", style: TextStyle(
                fontSize: 23,
            ),),
            TextField(
              decoration: InputDecoration(
                hintText: "Jeffrey KH"
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 40,),
            //---------------------------------------------------------- Text & Password
            Text("Password", style: TextStyle(
              fontSize: 23,
            ),),
            TextField(
              decoration: InputDecoration(
                  hintText: "your password"
              ),
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(height: 10,),
            //---------------------------------------------------------- Text & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: openForgotPassword,
                  child: Text("Forgot Password?", style: TextStyle(
                    fontSize: 16
                  ),),
                )
              ],
            ),
            //---------------------------------------------------------- Login Button
            Expanded(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Color(0xfff96060)
                  ),
                  child: InkWell(
                    onTap: openHome1, // Handle your callback
                    child: Text("Log In", style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                    ),),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //------------------------------------------------------------------- Navigation function
  void openForgotPassword()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
  }
  void openHome1()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
  void backToOnboard()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding()));
  }
}
