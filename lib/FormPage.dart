import 'package:flutter/material.dart';
import 'package:ders125/staffmembers.dart';

class TextFieldPage extends StatefulWidget {
  final Staffmembers? staff;
  const TextFieldPage({super.key,this.staff});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController contentControl1 = TextEditingController();
  TextEditingController contentControl2 = TextEditingController();
  TextEditingController contentControl3 = TextEditingController();
@override
void initState(){
  super.initState();
  if (widget.staff != null) {
    contentControl1.text = widget.staff!.namesurname!;
    contentControl2.text = widget.staff!.profession!;
    contentControl3.text = widget.staff!.workingperiod.toString();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Staff Member"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: contentControl1,
                  decoration: const InputDecoration(
                    labelText: "Enter Your Name",
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contentControl2,
                  decoration: const InputDecoration(
                    labelText: "Enter Profession",
                    hintText: "Profession",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contentControl3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter Working Period",
                    hintText: "Period",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text("Add"),
                      onPressed: () {
                        if (contentControl1.text.isEmpty ||
                            contentControl2.text.isEmpty ||
                            contentControl3.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("All fields are required"),
                            ),
                          );
                          return;
                        }
                        final updatedStaff= Staffmembers(
                          namesurname: contentControl1.text,
                          profession: contentControl2.text,
                          workingperiod: int.parse(contentControl3.text),
                        );
                        if(widget.staff==null){
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Confirm Submission"),
                              content: const Text(
                                "Are you sure you want to add this person?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(
                                      context,
                                      Staffmembers(
                                        namesurname: contentControl1.text,
                                        profession: contentControl2.text,
                                        workingperiod: int.parse(
                                          contentControl3.text,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("Confirm"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ],
                            ));}
                        else{
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                            title: const Text("Confirm Submission"),
                            content: const Text(
                              "Are you sure you want to update this person?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(
                                    context,
                                    Staffmembers(
                                      namesurname: contentControl1.text,
                                      profession: contentControl2.text,
                                      workingperiod: int.parse(
                                        contentControl3.text,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("Confirm"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                            ],
                          ));
                        }


                      },
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      child: const Text("Clear"),
                      onPressed: () {
                        setState(() {
                          contentControl1.clear();
                          contentControl2.clear();
                          contentControl3.clear();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
