import 'package:http/http.dart' as http;
import 'package:parcial_flutter_testing/models/models.dart';

class ApiService {
  static const _baseUrl = 'https://netcorewebapicustom.azurewebsites.net/api/Contacts';
  List<ContactResponse> listContacts = [];

  Future<List<ContactResponse>> requestGet() async {
    final response = await http.get(Uri.parse(_baseUrl));
    final contactResponse = contactResponseFromJson(response.body);    
    return contactResponse;
  }
}