// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';


class RadioList extends StatefulWidget {
  const RadioList({super.key});


  @override
  State<RadioList> createState() => _RadioListState();

}

class _RadioListState extends State<RadioList> {
  bool checkbox1 = false,
    checkbox2 = false,
    checkbox3 = false;
bool isbookchecked = false,
    istheaterchecked = false,
    ismusicchecked = false;
bool isradioyellowchecked = false,
    isradiobluechecked = false;
String radiocolors = "";
String checkedtext = "Hobbies:";
bool switchState = false;
late Color contcol = Colors.grey;
  void clearselection(){
    setState(() {
       checkbox1 = false;
          checkbox2 = false;
          checkbox3 = false;
       isbookchecked = false;
          istheaterchecked = false;
          ismusicchecked = false;
       isradioyellowchecked = false;
          isradiobluechecked = false;
      radiocolors = "";
       checkedtext = "Hobbies:";
      switchState = false;
      Color contcol = Colors.grey;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Radio Button Page"),),
   body:SingleChildScrollView(
      child: Column(
        children: [
          const Text("Choose your hobbies",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text((switchState ? "Good Morning" : "Good Evening"),
            style: TextStyle(
                color: switchState ? Colors.black : Colors.white),),
          SwitchListTile(
            secondary: const Icon(Icons.add_alarm),
            value: switchState, onChanged: (val) {
            setState(() {
              switchState = val;
            });
          },
            title: Text(switchState?"open":"closed")

            ,
          ),
          CheckboxListTile(value: isbookchecked,
            onChanged: (value)
            {
              setState(() {
                isbookchecked=value!;
              });
            },
            title: const Text("Reading Books",style: TextStyle(color: Colors.green),),
            activeColor: Colors.blue,
            checkColor: Colors.blueGrey,
          ),
          CheckboxListTile(value: ismusicchecked,
            onChanged: (value)
            {
              setState(() {
                ismusicchecked=value!;
              });
            },
            title: const Text("Listening Music",style: TextStyle(color: Colors.blue),),
            activeColor: Colors.blue,
            checkColor: Colors.blueGrey,
          ),
          CheckboxListTile(value: istheaterchecked,
            onChanged: (value)
            {
              setState(() {
                istheaterchecked=value!;
              });
            },
            title: const Text("Going theatre",style: TextStyle(color: Colors.lime),),
            activeColor: Colors.blue,
            checkColor: Colors.blueGrey,
          ),
          RadioListTile(
            selected: isradioyellowchecked,
            title: const Text("Yellow"),
            value: 'yellow',
            groupValue: radiocolors,
            onChanged: (vvv)
            {
              setState(() {
                isradioyellowchecked=true;
                radiocolors=vvv!;
                contcol=Colors.yellow;
              });
            },
            activeColor: Colors.yellow,
          ),
          RadioListTile(
            selected: isradiobluechecked,
            title: const Text("Green"),
            value: 'green',
            groupValue: radiocolors,
            onChanged: (vvv)
            {
              setState(() {
                isradiobluechecked=true;
                radiocolors=vvv!;
                contcol=Colors.green;
              });
            },
            activeColor: Colors.green,
          ),
          const SizedBox(height: 5,),
          ElevatedButton(
              child: const Text("Show",style: TextStyle(fontSize: 10),),
              onPressed: ()
              {checkedtext="Hobbies:";
              if(isbookchecked) {
                setState(() {
                  checkedtext=checkedtext+" Reading books ";
                });
              }
              if(ismusicchecked) {
                setState(() {
                  checkedtext=checkedtext+" Listening to music ";
                });
              }
              if(istheaterchecked) {
                setState(() {
                  checkedtext=checkedtext+" Going to theatre ";
                });
              }
              }),
          const SizedBox(height: 5,),
          Text(checkedtext,
            style: TextStyle(backgroundColor: contcol,
                fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          const SizedBox(height: 5,),
          ElevatedButton(onPressed: clearselection, child: Text("Clear Selections")),
        ],
      ),
    ),
    );}
}


