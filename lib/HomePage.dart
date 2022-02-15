// Import Packages
import 'package:flutter/material.dart';
import 'CheckList.dart';
import 'NewTask.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'NewNote.dart';

// Define Class A - Stateless
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: homePage(),
    );
  }
}

// Define Class B - Stateful
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}
// Define Class C - Widget
class _homePageState extends State<homePage> {
  //---------------------------------------------------------------- Constant & Variables
  String filterType = "today";
  DateTime today = new DateTime.now();
  String taskPop  = "close";
  var monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEPT", "OCT", "NOV", "DEC"];
  CalendarController ctrlr = new CalendarController();
  //---------------------------------------------------------------- Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //-------------------------------------------------------- AppBar
                AppBar(
                  backgroundColor: Color(0xff292e4e),
                  elevation: 0,
                  title: Text("To-do List", style: TextStyle(
                    fontSize: 30
                  ),),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.short_text,
                      color: Colors.white,
                          size: 30,
                      ),
                      onPressed: ()=> {
                      },
                    )
                  ],
                ),
                //--------------------------------------------------------------
                Container(
                  height: 70,
                  color: Color(0xff292e4e),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //--------------------------------------------------------Filter Button 1 (Today)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){changeFilter("today");},
                            child: Text("Today", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            ),),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 4,
                            width: 120,
                            color: (filterType== "today")?Colors.white:Colors.transparent,
                          )
                        ],
                      ),
                      //--------------------------------------------------------Filter Button 2 (Monthly)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){changeFilter("monthly");},
                            child: Text("Monthly", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            ),),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 4,
                            width: 120,
                            color: (filterType == "monthly")?Colors.white:Colors.transparent,
                          )
                        ],
                      )
                    ],
                  ),
                ),

                //--------------------------------------------------------------Months & Calendar
                (filterType == "monthly")?TableCalendar(
                  calendarController: ctrlr,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  initialCalendarFormat: CalendarFormat.week,
                ):Container(),

                //--------------------------------------------------------------Task (show)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Today ${monthNames[today.month-1]}, ${today.day}/${today.year}", style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                              ), )
                            ],
                          ),
                        ),
                        taskWidget(Color(0xFF448AFF), "Meeting with Jeff" , "9:00 AM"),
                        taskWidget(Colors.blue, "Call Richie" , "11:00 AM"),
                        taskWidget(Colors.green, "Exercise" , "4:00 PM"),
                      ],
                    ),
                  ),
                ),

                //--------------------------------------------------------------Taskbar (show)
                Container(
                  height: 110,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 90,
                            width: MediaQuery.of(context).size.width,
                          color: Color(0xff292e4e),
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //------------------------------------------------ My Task (Future Update)
                              Container(
                                child: Column(

                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5,),
                                    Text("My Task", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15
                                    ),)
                                  ],
                                ),
                              ),
                              //------------------------------------------------ Menu (Future Update)
                              Container(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5,),
                                    Text("Menu", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                    ),)
                                  ],
                                ),
                              ),
                              Container(width: 80,),
                              //------------------------------------------------ Shortcut (Future Update)
                              Container(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.content_paste,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5,),
                                    Text("Shortcut", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                    ),)
                                  ],
                                ),
                              ),
                              //------------------------------------------------ Profile (Future Update)
                              Container(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.account_circle,
                                      color: Colors.white,
                                    ),
                                    SizedBox(height: 5,),
                                    Text("Profile", style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                    ),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 0,
                        right: 0,
                        child: InkWell(
                          onTap: openTaskPop,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Color(0xFF448AFF), Colors.red],
                              ),
                              shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text("+", style: TextStyle(
                                fontSize: 40,
                                color: Colors.white
                              ),),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            //------------------------------------------------------------------ Pop Function to Add task
            Container(
              child: (taskPop == "open") ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: InkWell(
                    onTap: closeTaskPop,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white
                      ),
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //---------------------------------------------------- Add task Text
                          SizedBox(height: 1,),
                          InkWell(
                            onTap: openNewTask,
                            child: Container(
                              child: Text("Add Task", style: TextStyle(
                                fontSize: 18
                              ),),
                            ),
                          ),
                          Container(
                            height: 1,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            color: Colors.black.withOpacity(0.2),
                          ),
                          //---------------------------------------------------- Add Quick Note Button
                          InkWell(
                            onTap: openNewNote,
                            child: Container(
                              child: Text("Add Quick Note", style: TextStyle(
                                  fontSize: 18
                              ),),
                            ),
                          ),
                          Container(
                            height: 1,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            color: Colors.black.withOpacity(0.2),
                          ),
                          //---------------------------------------------------- Add Checklist Button
                          InkWell(
                            onTap: openNewCheckList,
                            child: Container(
                              child: Text("Add Checklist", style: TextStyle(
                                  fontSize: 18
                              ),),
                            ),
                          ),
                          SizedBox(height: 1,)
                        ],
                      ),
                    ),
                  ),
                ),
              ):Container(),
            )
          ],
        ),
    );
  }
  //------------------------------------------------------------------- Open-Close-Filter Task
  openTaskPop()
  {
    taskPop = "open";
    setState(() {});
  }
  closeTaskPop()
  {
    taskPop = "close";
    setState(() {});
  }
  changeFilter(String filter)
  {
    filterType = filter;
    setState(() {});
  }
  //------------------------------------------------------------------- Task Slide Widget
  Slidable taskWidget(Color color, String title, String time)
  {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: Offset(0,9),
            blurRadius: 20,
            spreadRadius: 1
          )]
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: color,
                width: 4)
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),),
                Text(time, style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18
                ),)
              ],
            ),
            Expanded(child: Container(),),
            Container(
              height: 50,
              width: 5,
              color: color,
            )
          ],
        ),
      ),
      //------------------------------------------------------------------------ Future Feature (Edit & Delete)
      secondaryActions: [
        IconSlideAction(
          caption: "Edit",
          color: Colors.white,
          icon: Icons.edit,
          onTap: (){},
        ),
        IconSlideAction(
          caption: "Delete",
          color: color,
          icon: Icons.edit,
          onTap: (){},
        )
      ],
    );
  }
  //------------------------------------------------------------------- Navigation function
  openNewTask()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewTask()));
  }
  openNewNote()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewNote()));
  }
  openNewCheckList()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckList()));
  }
}
