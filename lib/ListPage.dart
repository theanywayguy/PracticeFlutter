import 'package:ders125/FormPage.dart';
import 'package:flutter/material.dart';
import 'package:ders125/staffmembers.dart';

class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  List<Staffmembers> staffmemberlist = [
    Staffmembers(
        namesurname: "Brook Asnor", profession: "Account", workingperiod: 12),
    Staffmembers(
        namesurname: "Julia Iron", profession: "Finance", workingperiod: 16),
    Staffmembers(
        namesurname: "Ellan Welch", profession: "Trade", workingperiod: 5),
    Staffmembers(
        namesurname: "Mathilda Kartner",
        profession: "Finance",
        workingperiod: 9),
  ];

  String? selectedpersonnel = "None";

  // Function to add new staff member
  void addNewStaff(Staffmembers newStaff) {
    setState(() {
      staffmemberlist.add(newStaff);
    });
  }

  void updateStaff(int index, Staffmembers updatedStaff) {
    setState(() {
      staffmemberlist[index] = updatedStaff;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Staff Members"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
        if(staffmemberlist.isEmpty)
          const Text("List empty",
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
          else
          Expanded(
            child: ListView.builder(
              itemCount: staffmemberlist.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.account_box),
                  title: Text(staffmemberlist[index].namesurname!),
                  subtitle: Text(
                    "Profession: ${staffmemberlist[index].profession!}\nPeriod: ${staffmemberlist[index].workingperiod}",
                  ),
                  onTap: () {
                    setState(() {
                      selectedpersonnel =
                          "Personnel Info: ${staffmemberlist[index].namesurname}";
                    });
                    print(
                      "Personnel Info: ${staffmemberlist[index].namesurname} tapped.",
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Selected Personnel: $selectedpersonnel",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button background color
                ),
                label: const Text("Add"),
                icon: const Icon(Icons.save),
                onPressed: () async {
                  final newStaff = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextFieldPage(),
                    ),
                  );
                  if (newStaff != null && newStaff is Staffmembers) {
                    addNewStaff(newStaff);
                  }
                },
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                label: const Text("Update"),
                icon: const Icon(Icons.update),
                onPressed: () async {
                  final selectedindex = staffmemberlist.indexWhere((staff) =>
                      staff.namesurname ==
                      selectedpersonnel?.split(":")[1]?.trim());
                  if(selectedindex!=-1) {
                    final updatedStaff=await Navigator.push(context,MaterialPageRoute(
                        builder: (context) =>
                            TextFieldPage(
                              staff: staffmemberlist[selectedindex],
                            )));
                    if(updatedStaff!=null){
                      updateStaff(selectedindex, updatedStaff);
                    }
                  } },
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                label: const Text("Delete"),
                icon: const Icon(Icons.delete),
                onPressed: () {
    final selectedindex = staffmemberlist.indexWhere((staff) =>
    staff.namesurname ==
    selectedpersonnel?.split(":")[1]?.trim());
    if(selectedindex!=-1) {
      setState(() {
        staffmemberlist.removeAt(selectedindex);
        selectedpersonnel="none";
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select a personnel")));
    }
                },

              ),
            ],
          ),
        ],
      ),
    );
  }
}
