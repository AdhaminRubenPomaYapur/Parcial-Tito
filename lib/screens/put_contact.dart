import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/models/contacts_response.dart';
import 'package:parcial_flutter_testing/widgets/widgets.dart';

class PutContact extends StatelessWidget {

  const PutContact({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _emailController    = TextEditingController();
    TextEditingController _phoneController    = TextEditingController();
    TextEditingController _addressController  = TextEditingController();

    final ContactResponse contact = ModalRoute.of(context)!.settings.arguments as ContactResponse;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update contact'),
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
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black12,
          child: Form(
            child: Column(
              children: [
                const Divider( height: 20,),
                const Text('Updated Data', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white ),),
                const Divider( height: 30,),
                CustomTextFormField(
                  controller    : _fullNameController,
                  label         : 'Full Name',
                  icon          : Icons.people_alt_outlined,
                  initialValue  : contact.fullName,
                ),
                const Divider( height: 30,),
                CustomTextFormField(
                  controller    : _emailController,
                  label         : 'Email',
                  icon          : Icons.email_outlined,
                  initialValue  : contact.email,
                ),
                const Divider( height: 30,),
                CustomTextFormField(
                  controller    : _phoneController,
                  label         : 'Phone',
                  icon          : Icons.phone,
                  initialValue  : contact.phone.toString(),
                ),
                const Divider( height: 30,),
                CustomTextFormField(
                  controller    : _addressController,
                  label         : 'Address',
                  icon          : Icons.house_outlined,
                  initialValue  : contact.address,
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

                    },
                    child: const Text('Update', style: TextStyle( fontSize: 24, color: Colors.white ),),
                  ),
                )
              ],
            )
          ),
        )
      )
    );
  }
}
