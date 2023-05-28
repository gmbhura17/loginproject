import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginproject/CreatePage.dart';
// import 'package:loginapp/LogoutPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    // getdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        // leading: Icon(Icons.delete),
        automaticallyImplyLeading: false,
        title: Center(child: Text("Login Page")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Card(
                color: Colors.purple.shade900,
                elevation: 15,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.purple.shade50,
                    ),
                    child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Text("Sign in",style: TextStyle(fontSize: 25),),
                          SizedBox(height: 50,),
                          Padding(
                            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              cursorColor: Colors.brown ,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2,color: Colors.purple.shade900),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                border: OutlineInputBorder(),
                                hintText: 'Enter a Name',
                                hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.black45),
                                labelText: "Name",
                                labelStyle: TextStyle(fontSize: 18,color: Colors.purple.shade900),
                              ),
                              controller: _name,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              cursorColor: Colors.black54,
                              style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2,color: Colors.purple.shade900),
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(fontSize: 18,color: Colors.purple.shade900),
                                  hintText: 'Enter secure password',
                                  hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.black45)
                              ),
                              obscureText: true,
                              controller: _password,
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          GestureDetector(
                            onTap: () async {
                              var nm = _name.text.toString();
                              var ps = _password.text.toString();


                              SharedPreferences prefs = await SharedPreferences.getInstance();

                              var mainname = prefs.getString("name");
                              var mainpassword = prefs.getString("password");

                              if(nm==mainname && ps==mainpassword)
                              {
                                Fluttertoast.showToast(msg: "Entered Successfully");
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setString("Name", nm);
                                prefs.setString("islogin","yes");
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>HomePage())
                                );
                              }
                              else
                              {
                                Fluttertoast.showToast(msg: "Error");
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade900,
                                  borderRadius: BorderRadius.circular(60)
                              ),
                              child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.green),)),
                            ),


                          ),

                          // GestureDetector(
                          //   onTap: (){
                          //     Navigator.of(context).pop();
                          //     Navigator.of(context).push(
                          //         MaterialPageRoute(builder: (context)=>HomePage())
                          //     );
                          //   },
                          //   child: Container(
                          //     margin: EdgeInsets.all(10.0),
                          //     color: StyleResources.btncolor,
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 60.0,
                          //     alignment: Alignment.center,
                          //     child: Text("Login",style: StyleResources.btntext,),
                          //   ),
                          // ),

                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Forgot Password  then -"),
                              TextButton(
                                  onPressed:(){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => CreatePage()));
                                  },
                                  child: Text("Registration",style: TextStyle(fontSize: 15),)),
                            ],
                          ),
                          SizedBox(height: 20,),
                        ]
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 280,
                  top: 40),
              child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Back",style: TextStyle(fontSize: 20),)),
            ),
          ],
        ),
      ),
    );
  }
}















// Text(
//   str,
//   style: TextStyle(color: Colors.blue, fontSize: 30.0),
// ),
// Text(
//   val,
//   style: TextStyle(color: Colors.blue, fontSize: 30.0),
// ),




//
// setState(() {
// str = _password.text.toString();
// val = _name.text.toString();
// });







//
// SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.setString("n1", _name.text.toString());
// prefs.setString("n2", _password.text.toString());