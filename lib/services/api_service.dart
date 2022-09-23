import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parcial_flutter_testing/models/models.dart';

class ApiService {
  static const _baseUrl = 'https://netcorewebapicustom.azurewebsites.net/api/Contacts';
  
  Future<List<ContactResponse>> requestGet() async {
    final response = await http.get(Uri.parse(_baseUrl));
    final contactResponse = contactResponseFromJson(response.body);    
    return contactResponse;
  }

  Future<void> createContact(ContactResponse contactResponse) async {
    
    await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        "fullName": contactResponse.fullName,
        "email"   : contactResponse.email,
        "phone"   : contactResponse.phone,
        "address" : contactResponse.address
      })
    );
    
    return;
  }
}