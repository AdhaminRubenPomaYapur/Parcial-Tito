import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/models/contacts_response.dart';
import 'package:parcial_flutter_testing/services/api_service.dart';


class ListContacts extends StatelessWidget {
  const ListContacts({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric( horizontal: 10, vertical: 20 ),
          
          child: FutureBuilder(
            future: ApiService().requestGet(),
            builder: (BuildContext context, AsyncSnapshot<List<ContactResponse>> snapshot) {
          
              if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              
              List<ContactResponse> contacts = snapshot.data!;
          
              return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.people),
                    title: Text(contacts[index].fullName),
                    trailing: const Icon(Icons.edit),
                    onTap: () => Navigator.pushReplacementNamed(context, 'putContacts', arguments: contacts[index]),
                  );
                },
                separatorBuilder: (context, index) => const Divider( height: 10,),
                itemCount: contacts.length,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacementNamed(context, 'postContacts'),
        child: const Icon(Icons.add)
      ),
    );
  }
}
