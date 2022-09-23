// To parse this JSON data, do
//
//     final contactResponse = contactResponseFromJson(jsonString);

import 'dart:convert';

List<ContactResponse> contactResponseFromJson(String str) => List<ContactResponse>.from(json.decode(str).map((x) => ContactResponse.fromJson(x)));

String contactResponseToJson(List<ContactResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactResponse {
    ContactResponse({
        this.id,
        required this.fullName,
        required this.email,
        required this.phone,
        required this.address,
    });

    set fullName(String fullname) => fullName = fullname;
    set email   (String email)    => email    = email;
    set phone   (int    phone)    => phone    = phone;
    set address (String address)  => address  = address;

    final String? id;
    final String fullName;
    final String email;
    final int phone;
    final String address;

    factory ContactResponse.fromJson(Map<String, dynamic> json) => ContactResponse(
        id      : json["id"],
        fullName: json["fullName"],
        email   : json["email"],
        phone   : json["phone"],
        address : json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id"      : id,
        "fullName": fullName,
        "email"   : email,
        "phone"   : phone,
        "address" : address,
    };
}
