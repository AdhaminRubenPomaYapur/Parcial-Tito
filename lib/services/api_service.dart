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

  Future<ContactResponse> createContact(ContactResponse contactResponse) async {
    
    Map data = {
      "id"      : contactResponse.id,
      "fullName": contactResponse.fullName,
      "email"   : contactResponse.email,
      "phone"   : contactResponse.phone,
      "address" : contactResponse.address,
    };

    final response = await http.post(
      Uri.parse(_baseUrl),
      body: jsonEncode(data)
    );
    
    if(response.statusCode == 200){
      return ContactResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to created Contact');
    }
  }
}