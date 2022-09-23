import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/services/api_service.dart';
import 'package:parcial_flutter_testing/widgets/widgets.dart';

class PostContact extends StatefulWidget {

  const PostContact({Key? key}) : super(key: key);

  @override
  State<PostContact> createState() => _PostContactState();
}

class _PostContactState extends State<PostContact> {

  final ApiService _apiService              = ApiService();
  final GlobalKey<FormState> _addFormKey    = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController    = TextEditingController();
  TextEditingController _phoneController    = TextEditingController();
  TextEditingController _addressController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
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
                const Text('Create Data', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white ),),
                const Divider( height: 30,),
                CustomTextFormField(
                  controller: _fullNameController,
                  label    : 'Full Name',
                  icon     : Icons.people_alt_outlined,
                  
                ),
                const Divider( height: 30,),
                CustomTextFormField(
                  controller: _emailController,
                  label    : 'Email',
                  icon     : Icons.email_outlined,
                  
                ),
                const Divider( height: 30,),
                CustomTextFormField(
                  controller: _phoneController,
                  label    : 'Phone',
                  icon     : Icons.phone,
                  
                ),
                const Divider( height: 30,),
                CustomTextFormField(
                  controller: _addressController,
                  label    : 'Address',
                  icon     : Icons.house_outlined,
                  
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

