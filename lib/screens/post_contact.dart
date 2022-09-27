import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/models/models.dart';
import 'package:parcial_flutter_testing/services/api_service.dart';
import 'package:parcial_flutter_testing/widgets/widgets.dart';

class PostContact extends StatelessWidget {

  const PostContact({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    ApiService apiService = ApiService();
    GlobalKey<FormState>  addFormKey        = GlobalKey<FormState>();
    String fullName = '';
    String email    = '';
    String phone    = '';
    String address  = '';

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
                    initialValue  : fullName,
                    label         : 'Full Name',
                    icon          : Icons.people_alt_outlined,
                    onChanged: (value) => fullName = value,
                    validator: (value) => Validator.validatorName(value),
                  ),
                  const Divider( height: 30,),
                  CustomTextFormField(
                    initialValue  : email,
                    label         : 'Email',
                    icon          : Icons.email_outlined,
                    onChanged: (value) => email = value,
                    validator: (value) => Validator.validatorEmail(value),
                  ),
                  const Divider( height: 30,),
                  CustomTextFormField(
                    initialValue  : phone,
                    label         : 'Phone',
                    icon          : Icons.phone,
                    onChanged: (value) => phone = value,
                    validator: (value) => Validator.validatorPhoneNumer(value),
                  ),
                  const Divider( height: 30,),
                  CustomTextFormField(
                    initialValue  : address,
                    label         : 'Address',
                    icon          : Icons.house_outlined,
                    onChanged: (value) => address = value,
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
                              fullName : fullName,
                              email    : email,
                              phone    : int.parse(phone), 
                              address  : address
                            )
                          );
                          Navigator.pushNamed(context, 'listContacts');
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



