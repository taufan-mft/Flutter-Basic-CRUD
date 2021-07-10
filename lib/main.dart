import 'dart:developer';

import 'package:employee/repository/employee_model.dart';
import 'package:employee/repository/repository.dart';
import 'package:employee/screens/edit_data.dart';
import 'package:employee/screens/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EmployeeModel> listEmployee = [];
  Repository repository = Repository();
  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 22),),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title:Text('Project Nurul'),
        actions: [
          IconButton(
            icon: Icon(Icons.add), onPressed: () async {

              await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditData(isEdit: false)),
          );
            _fetchData();
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listEmployee.length,
          itemBuilder: (context, index) {

            return Padding(
              padding: EdgeInsets.all(4),
              child: Card(
                elevation: 4,
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditData(isEdit: true, employeeModel: listEmployee[index])),
                    );
                    log("lagi");
                    _fetchData();
                  },
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listEmployee[index].employeeName!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _fetchData() async {
    listEmployee = await repository.fetchAllEmployee();
    setState(() {

    });
  }
}

