// To parse this JSON data, do
//
//     final contactResponse = contactResponseFromJson(jsonString);

import 'dart:convert';

List<ContactResponse> contactResponseFromJson(String str) => List<ContactResponse>.from(json.decode(str).map((x) => ContactResponse.fromJson(x)));

String contactResponseToJson(List<ContactResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactResponse {
    ContactResponse({
        required this.id,
        required this.fullName,
        required this.email,
        required this.phone,
        required this.address,
    });

    final String id;
    final String fullName;
    final String email;
    final int phone;
    final String address;

    factory ContactResponse.fromJson(Map<String, dynamic> json) => ContactResponse(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "address": address,
    };
}
