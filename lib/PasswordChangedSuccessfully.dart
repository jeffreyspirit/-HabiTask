// Import Packages
import 'package:flutter/material.dart';
import 'HomePage.dart';

// Define Class A - Stateless
class PasswordChangedSuccessfully extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: passwordChangedSuccessfully(),
    );
  }
}

// Define Class B - Stateful
class passwordChangedSuccessfully extends StatefulWidget {
  @override
  _passwordChangedSuccessfullyState createState() => _passwordChangedSuccessfullyState();
}

// Define Class C - Widget
class _passwordChangedSuccessfullyState extends State<passwordChangedSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //----------------------------------------------------------  Image Icon
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/image/success.png")
              )
            ),
          ),
          //----------------------------------------------------------  Text Parts
          Text("Successful!", style: TextStyle(
            fontSize: 35
          ),),
          Text("You have successfully changed our password. Please use your new password to login!", style: TextStyle(
            fontSize: 18,
          ),textAlign: TextAlign.center,),
          SizedBox(height: 70,),
          //----------------------------------------------------------  Next Page Button
          Center(
            child: InkWell(
              onTap: openHomePage,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Color(0xFFEE82A2)
                ),
                child: Text("Continue", style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //------------------------------------------------------------------- Navigation function
  void openHomePage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
}

