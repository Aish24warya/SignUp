
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:signup/RegistrationCom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Homescreen extends StatefulWidget {
 const Homescreen({super.key});

@override
  State<Homescreen> createState() => _HomescreenState();
  
  
}

class _HomescreenState extends State<Homescreen> {
  String firstname="",lastname="", dateofbirth="",gender="",
  email="",contact="",password="";
  bool showPass =true;
  bool validateUser = true;
  final authInstance = FirebaseAuth.instance;
  final storeInstance = FirebaseFirestore.instance;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       body: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[Color(0xffEECEB9),Color(0xffBB9AB1)]),
            
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "REGISTRATION FORM ",
                    style: TextStyle(
                        fontFamily: 'regular',
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height:10 ),
              Center(
                child: Text(
                  "Please fill out the form carefully for registration",
                  style: TextStyle(
                      fontFamily: 'regular', fontSize: 20, color: Colors.black),
                ),
              ),
              const SizedBox(height: 40),
              validateUser == false?const Text("Please check all the fields"):const Text(""),
    
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Expanded(
              child: Padding(
              padding: const EdgeInsets.only(left: 80,right: 20),
              child: TextField(
              onChanged: (First_Name) {
               firstname = First_Name;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: "First Name",
            hintText: "Enter First Name",
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
        
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ),
    SizedBox(width: 30),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left:20,right:80),
        child: TextField(
          onChanged: (Last_Name) {
            lastname = Last_Name;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: "Last Name",
            hintText: "Enter Last Name",
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
                 ),
                 ),
                 ),
                ),
              ),
            ],
          ),
                 SizedBox(
                  height:20
                 ),
                 Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Expanded(
                child:  Padding(
                  padding: const EdgeInsets.only(left:80,right:20),
                  child: TextField(
                    onChanged: (DOB){
                      dateofbirth = DOB; 
                    },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Date Of Birth",
                    hintText: "DD/MM/YYYY ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                              
                 ),
                ),
                ),
                const SizedBox(
                  height:20
                 ),
                  SizedBox(width: 30),
                 Expanded(
                  child:Padding(
                  padding: const EdgeInsets.only(left:20,right:80),
                  child: TextField(
                    onChanged: (Gender){
                      gender = Gender; 
                    },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Gender",
                    hintText: "gender",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                              
                 ),
                ),
                 ),
          ],
        ),
               SizedBox(
                height: 20,
               ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Expanded(
                
                 child:  Padding(
                  padding: const EdgeInsets.only(left:80,right: 20),
                  child: TextField(
    
                    onChanged: (Number){
                      contact = Number; 
                    },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Contact Number",
                    hintText: "Enter Contact Number",
                    prefixIcon: Icon(Icons.call,
                    color: Colors.black,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                              
                 ),
                ),
                ),
                SizedBox(
                  height: 20,
                ), 
                SizedBox(width: 30),
                Expanded(
                  child:Padding(
                  padding: const EdgeInsets.only(left:20,right: 80),
                  child: TextField(
    
                    onChanged: (pass){
                      password = pass; 
                    },
                    obscureText:showPass,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: GestureDetector(
                      onTap:() {
                        setState(() {
                        showPass = !showPass;  
                        });
                      },
                      child:showPass?const Icon(Icons.visibility_off):const Icon(Icons.visibility)),
                    labelText: "Password",
                    hintText: "Please create your Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                              
                 ),
                ),
                ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left:80,right: 80),
                  child: TextField(
                    onChanged: (Email){
                      email = Email; 
                    },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Email",
                    hintText: "Enter Email Address",
                    prefixIcon: Icon(Icons.email,
                    color: Colors.black,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                              
                 ),
                ),
                SizedBox(height:20),
                RawMaterialButton(
                  onPressed: () async{
                    if(email !="" && password != "" && contact !=""
                    && firstname !=""&& lastname !="" &&  dateofbirth !="" && gender !=""){ 
                      setState(() {
                        validateUser = true;
                      });
                      try {
                         await  authInstance.createUserWithEmailAndPassword(email: email, password: password);
                      } catch (error) {
                        Fluttertoast.showToast(msg: error.toString());
                      }}
                  else{
                    setState(() {
                      validateUser = false;
                    });
                  }
                  if(authInstance.currentUser!=null){
                    print(authInstance.currentUser !.uid);
                     await storeInstance.collection("Users").doc(authInstance.currentUser !.uid).set(
                       {
                        "Firstname" : firstname,
                        "Lastname":lastname, 
                        "DOB":dateofbirth,
                        "Gender":gender,
                        "Contact":contact,
                         "email":email,
                         "Password":password
                       }
                    );
                     Navigator.push(context,MaterialPageRoute(builder:(context)=>const Registrationcom()));
                  }
                  },
                    
                  fillColor: Color(0xff36C2CE),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Text("SUBMIT",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    )
                    ),
                  ),
                  )
               
              ]  
              ),
        ),
      ),
        
      );


  }
}
