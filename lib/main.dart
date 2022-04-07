// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedQualities = "Creativity";
  List<String> selectedItem_ArrayList = []; //Storing DropDown selected data

  List<String> qualities = [
    "Creativity",
    "Commitment",
    "Planning",
    "Optimism",
    "Innovative"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hola"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What qualities do I have to support me in achieving my goal.",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      //: Colors.red,
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < selectedItem_ArrayList.length; i++)
                        ListTile(
                          title: Text(qualities
                              .indexOf(selectedItem_ArrayList[i])
                              .toString()),
                          // Text(selectedItem_ArrayList.indexOf(selectedItem_ArrayList[i]).toString()),
                          trailing: GestureDetector(
                            //#################### remove specific index item
                            onTap: () {
                              setState(() {
                                selectedItem_ArrayList
                                    .remove(selectedItem_ArrayList[i]);
                              });
                            },
                            child: Icon(
                              Icons.delete_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                    ],
                  )),
                ),
                Expanded(
                  //===============================================================> Second row widget
                  child: Container(
                    //color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select new skills"),
                        Container(
                          // width: 163,
                          height: 40,
                          decoration: BoxDecoration(
                            //color: Colors.green,
                            border: Border.all(
                              color: Color(0xff8E8E8E),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          margin: EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              isExpanded: true,
                              onChanged: (value) {
                                if (!selectedItem_ArrayList.contains(value)) {
                                  //=============================================>>>Items Disable after selection
                                  setState(() {
                                    selectedQualities = value!;
                                    selectedItem_ArrayList
                                        .add(selectedQualities);
                                  });
                                }
                                //==============================================>>>Adding item into list
                              },
                              value: selectedQualities,
                              items: qualities
                                  .map((dropdownValue) => DropdownMenuItem(
                                        child: Text(
                                          dropdownValue,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: selectedItem_ArrayList
                                                    .contains(dropdownValue)
                                                ? Colors.grey
                                                : null,
                                          ),
                                        ),
                                        value: dropdownValue,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
