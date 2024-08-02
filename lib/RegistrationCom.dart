import 'package:flutter/material.dart';
class Registrationcom extends StatefulWidget {
  const Registrationcom({super.key});

  @override
  State<Registrationcom> createState() => _RegistrationcomState();
}

class _RegistrationcomState extends State<Registrationcom> {
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
                  padding: const EdgeInsets.all(100),
                  child: Text(
                    "Your Registration Form has been Successfully Submitted ",
                    style: TextStyle(
                        fontFamily: 'regular',
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
     
              ]  
              ),
        ),
      ),
        
      );

  }
}