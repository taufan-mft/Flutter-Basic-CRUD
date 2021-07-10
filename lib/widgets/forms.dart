import 'package:employee/repository/employee_model.dart';
import 'package:employee/repository/repository.dart';
import 'package:flutter/material.dart';

class Formsku extends StatefulWidget {
  final EmployeeModel? employee;
  final bool isEdit;
  const Formsku({Key? key, this.employee, required this.isEdit}) : super(key: key);

  @override
  _FormskuState createState() => _FormskuState();
}

class _FormskuState extends State<Formsku> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _contCode = new TextEditingController();
  TextEditingController _contName = new TextEditingController();
  TextEditingController _contGender = new TextEditingController();
  TextEditingController _contPlace = new TextEditingController();
  TextEditingController _contDate = new TextEditingController();
  TextEditingController _contEdu = new TextEditingController();
  TextEditingController _contDept = new TextEditingController();
  TextEditingController _contPos = new TextEditingController();
  TextEditingController _contStat = new TextEditingController();
  TextEditingController _contPhone = new TextEditingController();
  TextEditingController _contAddr = new TextEditingController();
  TextEditingController _contPost = new TextEditingController();
  String btnText = 'Kirim';
  Repository repository = Repository();
  @override
  void initState() {
   if (widget.employee != null) {
     _getInitialData();
   }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contCode,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Employee Code',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contName,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Employee Name',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contGender,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Gender',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contPlace,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Place birth',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.datetime,
                controller: _contDate,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Date Birth',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contEdu,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Education',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contDept,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Department',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contPos,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Position',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contStat,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Status',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                controller: _contPhone,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Phone',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: _contAddr,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Address',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                controller: _contPost,
                validator: (val) => val!.isNotEmpty ? null : 'Masih kosong',
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Postal Code',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        borderSide: new BorderSide()))),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  EmployeeModel emp = _createEmployee();
                 if (widget.isEdit) {
                   await repository.updateEmployee(emp);
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text(
                         "Update data berhasil."),
                   ));
                   Navigator.pop(context);
                 } else {
                   await repository.addEmployee(emp);
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text(
                         "Tambah employee berhasil."),
                   ));
                   Navigator.pop(context);
                 }

                }
              },
              child: Text('Kirim'),
            )
          ],
        ),
      ),
    ));
  }

  void _getInitialData() {
    var emp = widget.employee!;
    _contName.text = emp.employeeName!;
    _contCode.text = emp.employeeCode!;
    _contGender.text = emp.gender!;
    _contPlace.text = emp.placeBirth!;
    _contDate.text = emp.dateBirth!;
    _contEdu.text = emp.education!;
    _contDept.text = emp.departement!;
    _contPos.text = emp.position!;
    _contStat.text = emp.status!;
    _contPhone.text = emp.phone!;
    _contAddr.text = emp.address!;
    _contPost.text = emp.postalCode!;

  }

  EmployeeModel _createEmployee() {
    return EmployeeModel(id: widget.employee != null? widget.employee!.id: 0,
    employeeName: _contName.text,
    employeeCode: _contCode.text,
    gender: _contGender.text,
    placeBirth: _contPlace.text,
    dateBirth: _contDate.text,
    education: _contEdu.text,
    departement: _contDept.text,
    position: _contPos.text,
    status: _contStat.text,
    phone: _contPhone.text,
    address: _contAddr.text,
    postalCode: _contPost.text
    );
  }
}
