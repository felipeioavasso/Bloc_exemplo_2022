import 'dart:math';

import 'package:app_bloc_2022/blocs/client_block.dart';
import 'package:app_bloc_2022/blocs/client_state.dart';
import 'package:app_bloc_2022/blocs/clients_events.dart';
import 'package:app_bloc_2022/model/client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  
  late final ClientBloc bloc;

  @override
  void initState() {
    bloc = ClientBloc();
    //bloc.inputClient.add(LoadClientEvent());
    bloc.add(LoadClientEvent());
    super.initState();
  }

  @override
  void dispose() {
    //bloc.inputClient.close();
    bloc.close();
    super.dispose();
  }

  String randomName(){
    final rand = Random();
    return ['Ana Maria', 'Bianca Nevis', 'Vinicius Silva'].elementAt(1);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            onPressed: (){bloc.add(
              AddClientEvent(client: Client(nome: randomName()))
            );}, 
            icon: const Icon(Icons.person_add),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: BlocBuilder<ClientBloc,ClientState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ClientInitialState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ClientSucessState){
              final clientList = state.clients;
            
              return ListView.separated(
                
                separatorBuilder: (_, __) => const Divider(), 
                itemCount: clientList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text(clientList[index].nome.substring(0,1)),
                    ),
                  ),
                  title: Text(clientList[index].nome),
                  trailing: IconButton(
                    onPressed: (){
                      bloc.add(
                        RemoveClientEvent(client: clientList[index])
                      );
                    }, 
                    icon: const Icon(Icons.remove)
                  ),
                ), 
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}