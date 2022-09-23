import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/models/contacts_response.dart';
import 'package:parcial_flutter_testing/models/models.dart';
import 'package:parcial_flutter_testing/services/api_service.dart';
import 'package:parcial_flutter_testing/widgets/widgets.dart';

class PutContact extends StatelessWidget {

  const PutContact({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    ApiService apiService = ApiService();
    GlobalKey<FormState>  addFormKey        = GlobalKey<FormState>();

    ContactResponse contact = ModalRoute.of(context)?.settings.arguments as ContactResponse;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create contact'),
      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 91, 186, 230),
              Color.fromARGB(255, 59, 130, 189)
            ]
          )
        ),
        margin: const EdgeInsets.symmetric( horizontal: 20, vertical: 30 ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.black12,
            child: Form(
              key: addFormKey,
              child: Column(
                children: [
                  const Divider( height: 20,),
                  const Text('Create Data', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white ),),
                  const Divider( height: 30,),
                  CustomTextFormField(
                    initialValue  : contact.fullName,
                    label         : 'Full Name',
                    icon          : Icons.people_alt_outlined,
                    onChanged: (value) => contact.fullName = value,
                    validator: (value) => Validator.validatorName(value),
                  ),
                  const Divider( height: 30,),
                  CustomTextFormField(
                    initialValue  : contact.email,
                    label         : 'Email',
                    icon          : Icons.email_outlined,
                    onChanged: (value) => contact.email = value,
                    validator: (value) => Validator.validatorEmail(value),
                  ),
                  const Divider( height: 30,),
                  CustomTextFormField(
                    initialValue  : contact.phone.toString(),
                    label         : 'Phone',
                    icon          : Icons.phone,
                    onChanged: (value) => contact.phone = int.parse(value),
                    validator: (value) => Validator.validatorPhoneNumer(value),
                  ),
                  const Divider( height: 30,),
                  CustomTextFormField(
                    initialValue  : contact.address,
                    label         : 'Address',
                    icon          : Icons.house_outlined,
                    onChanged: (value) => contact.address = value,
                    validator: (value) => Validator.validatorAddress(value),
                  ),
                  const Divider( height: 50,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black45,
                    ),
                    width: 250,
                    height: 60,
                    child: TextButton(
                      onPressed: () {
                        if(addFormKey.currentState?.validate() ?? false){
                          apiService.createContact(
                            ContactResponse(
                              fullName : contact.fullName,
                              email    : contact.email,
                              phone    : contact.phone, 
                              address  : contact.email
                            )
                          );
                          Navigator.pushReplacementNamed(context, 'listContacts');
                        }
                      },
                      child: const Text('Create', style: TextStyle( fontSize: 24, color: Colors.white ),),
                    ),
                  ),
                  const Divider( height: 20,),
                ],
              )
            ),
          ),
        )
      )
    );
  }
}
