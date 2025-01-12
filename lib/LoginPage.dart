import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TextFormFieldPage extends StatefulWidget {
  const TextFormFieldPage({super.key});

  @override
  State<TextFormFieldPage> createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  final _formkey = GlobalKey<FormState>();
  String? email, password, validatedemail, validatedpassword;
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
   body: SingleChildScrollView(
     child: Form(
         key: _formkey,
         child: Padding(
           padding: EdgeInsets.all(8.0),
           child: Column(
             children: [
               TextFormField(
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                   hintText: "Enter your email",
                   labelText: "Email",
                   prefixIcon: Icon(Icons.mail),
                   border: OutlineInputBorder(),
                 ),
                 validator: (val){
                   if(val!.isEmpty) return "EMAIL CANNOT BE EMPTY";
                   else if(!val.contains("@")) return  "Email is not valid";
                   return null;
                 },
                 onSaved: (val){email=val;},

               ),
               SizedBox(height: 20,),
               TextFormField(
                 obscureText: passenable,
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                   hintText: "Enter your password",
                   labelText: "password",
                   prefixIcon: Icon(Icons.lock),
                   suffix: IconButton(onPressed: (){setState(() {
                     if(passenable) passenable=false;else passenable=true;
                   });}, icon:Icon(passenable==true?Icons.remove_red_eye:Icons.password)) ,
                   border: OutlineInputBorder(),
                 ),
                 validator: (val){
                   if(val!.isEmpty) return "Password cannot be empty";
                   else if(val.trim().length<6) return  "Password Length is invalid";
                   return null;
                 },
                 onSaved: (val){password=val;},

               ),
               SizedBox(height: 20,),
               ElevatedButton(onPressed: (){if(_formkey.currentState!.validate()){
                 _formkey.currentState!.save();
                 setState(() {
                   validatedemail="Welcome"+email!;
                   validatedpassword=password;
                 });
               }}, child: Text("Login")),
               SizedBox(height: 20,),
               Text(validatedemail != null?"$validatedemail":" "),
               SizedBox(height: 20,),
               Text(validatedpassword != null?":) Your password $validatedpassword":" "),
             ],
           ),
         )),
   ));
  }
}
