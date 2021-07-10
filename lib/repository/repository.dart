

import 'dart:convert';
import 'dart:developer';

import 'package:employee/repository/employee_model.dart';
import 'package:http/http.dart' as http;


class Repository {
  static const HOST_URI = 'https://jerrysibarani.com/uasandroid/public/api/employee';
  Repository();
  
  Future<List<EmployeeModel>> fetchAllEmployee() async {
    final response = await http.get(Uri.parse(HOST_URI));
    List<EmployeeModel> list = EmployeeModel.parseResponse(response.body);
    return list;
  }

  Future<bool> addEmployee(EmployeeModel employee) async {
    String body = jsonEncode(employee);
    log(body);
    final response = await http.post(Uri.parse(HOST_URI), body: body, headers: {"Content-Type": "application/json"});
    log(response.body);
    return true;
  }

  Future<bool> updateEmployee(EmployeeModel employee) async {
    String body = jsonEncode(employee);
    log(body);
    final response = await http.put(Uri.parse(HOST_URI), body: body, headers: {"Content-Type": "application/json"});
    log(response.body);
    return true;
  }

  Future<bool> deleteEmployee(EmployeeModel employee) async {
    String body = jsonEncode(employee);
    final response = await http.delete(Uri.parse(HOST_URI), body: body, headers: {"Content-Type": "application/json"});
    return true;
  }
  
  
}