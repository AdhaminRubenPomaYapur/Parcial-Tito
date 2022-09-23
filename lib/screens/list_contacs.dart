import 'package:flutter/material.dart';
import 'package:parcial_flutter_testing/models/contacts_response.dart';
import 'package:parcial_flutter_testing/services/api_service.dart';


class ListContacts extends StatefulWidget {
  const ListContacts({super.key});

  @override
  State<ListContacts> createState() => _ListContactsState();
}

class _ListContactsState extends State<ListContacts> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Contacts'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, 'postContacts'), 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric( horizontal: 10 ),
          
          child: RefreshIndicator(
            onRefresh: () => Future.delayed( const Duration( seconds: 2 )),
            child: FutureBuilder(
              future: ApiService().requestGet(),
              builder: (BuildContext context, AsyncSnapshot<List<ContactResponse>> snapshot) {
          
                if(!snapshot.hasData){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
          
                List<ContactResponse> contacts = snapshot.data!;
          
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.people),
                      title: Text(contacts[index].fullName),
                      trailing: const Icon(Icons.edit),
                      onTap: () => Navigator.pushNamed(context, 'putContacts', arguments: contacts[index]),
                    );
                  },
                  itemCount: contacts.length,
                );
              },
          
              
            ),
          ),
        ),
      ),
    );
  }
}