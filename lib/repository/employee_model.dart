import 'dart:convert';

/// id : 2
/// employee_code : "abc001"
/// employee_name : "jerry ns"
/// gender : "male"
/// place_birth : "jakarta"
/// date_birth : "1997-09-07"
/// education : "Master"
/// departement : "IT"
/// position : "Manager"
/// status : "active"
/// phone : "0817342423"
/// address : "Jakarta"
/// postal_code : "11470"
/// created_at : "2021-07-06T07:16:37.000000Z"
/// updated_at : "2021-07-07T15:56:34.000000Z"

class EmployeeModel {
  int? _id;
  String? _employeeCode;
  String? _employeeName;
  String? _gender;
  String? _placeBirth;
  String? _dateBirth;
  String? _education;
  String? _departement;
  String? _position;
  String? _status;
  String? _phone;
  String? _address;
  String? _postalCode;

  int? get id => _id;
  String? get employeeCode => _employeeCode;
  String? get employeeName => _employeeName;
  String? get gender => _gender;
  String? get placeBirth => _placeBirth;
  String? get dateBirth => _dateBirth;
  String? get education => _education;
  String? get departement => _departement;
  String? get position => _position;
  String? get status => _status;
  String? get phone => _phone;
  String? get address => _address;
  String? get postalCode => _postalCode;

  EmployeeModel({
      int? id, 
      String? employeeCode, 
      String? employeeName, 
      String? gender, 
      String? placeBirth, 
      String? dateBirth, 
      String? education, 
      String? departement, 
      String? position, 
      String? status, 
      String? phone, 
      String? address, 
      String? postalCode, }){
    _id = id;
    _employeeCode = employeeCode;
    _employeeName = employeeName;
    _gender = gender;
    _placeBirth = placeBirth;
    _dateBirth = dateBirth;
    _education = education;
    _departement = departement;
    _position = position;
    _status = status;
    _phone = phone;
    _address = address;
    _postalCode = postalCode;
}

  EmployeeModel.fromJson(dynamic json) {
    _id = json["id"];
    _employeeCode = json["employee_code"];
    _employeeName = json["employee_name"];
    _gender = json["gender"];
    _placeBirth = json["place_birth"];
    _dateBirth = json["date_birth"];
    _education = json["education"];
    _departement = json["departement"];
    _position = json["position"];
    _status = json["status"];
    _phone = json["phone"];
    _address = json["address"];
    _postalCode = json["postal_code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["employee_code"] = _employeeCode;
    map["employee_name"] = _employeeName;
    map["gender"] = _gender;
    map["place_birth"] = _placeBirth;
    map["date_birth"] = _dateBirth;
    map["education"] = _education;
    map["departement"] = _departement;
    map["position"] = _position;
    map["status"] = _status;
    map["phone"] = _phone;
    map["address"] = _address;
    map["postal_code"] = _postalCode;
    return map;
  }
  static List<EmployeeModel> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<EmployeeModel>((json) => EmployeeModel.fromJson(json)).toList();
  }
}