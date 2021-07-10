import 'package:employee/repository/employee_model.dart';
import 'package:employee/repository/repository.dart';
import 'package:employee/widgets/forms.dart';
import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  final bool isEdit;
  final EmployeeModel? employeeModel;
  const EditData({Key? key, required this.isEdit, this.employeeModel}) : super(key: key);

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  Repository repo = Repository();

  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Hapus?",
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog

            new TextButton(
              child: new Text("Batal", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new TextButton(
              child: new Text("Oke!", style: TextStyle(color: Colors.black)),
              onPressed: () async {
              repo.deleteEmployee(widget.employeeModel!);
              Navigator.pop(context);
              Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.isEdit? 'Edit Employee': 'Add Employee'),
      actions: widget.isEdit? [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _showDialog(context);
          },
        )
      ]: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Formsku(employee: widget.employeeModel, isEdit: widget.isEdit,),
        ),
      ),
    );
  }
}
