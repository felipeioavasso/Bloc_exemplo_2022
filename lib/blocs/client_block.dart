import 'dart:async';
import 'package:app_bloc_2022/blocs/client_state.dart';
import 'package:app_bloc_2022/blocs/clients_events.dart';
import 'package:app_bloc_2022/model/client.dart';
import 'package:app_bloc_2022/repositories/client_repositories.dart';
import 'package:bloc/bloc.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState>{
  final _clientRepo = ClientsRepository();

  /* final StreamController<ClientEvent> _inputClientController = StreamController<ClientEvent>();
  final StreamController<ClientState> _outputClientController = StreamController<ClientState>();


  Sink<ClientEvent> get inputClient => _inputClientController.sink;
  Stream<ClientState> get stream => _outputClientController.stream; */

  ClientBloc() : super(ClientInitialState()){
    /* _inputClientController.stream.listen(_mapEventState); */
    on<LoadClientEvent>(
      (event, emit) => emit(ClientSucessState(
        clients: _clientRepo.loadClients()))
    );

    on<AddClientEvent>(
      (event, emit) => emit(ClientSucessState(
        clients: _clientRepo.addClient(event.client)))
    );

    on<RemoveClientEvent>(
      (event, emit) => emit(ClientSucessState(
        clients: _clientRepo.removeCliente(event.client)))
    );
  }

  /* _mapEventState(ClientEvent event){
    List<Client> clients = [];

    if (event is LoadClientEvent) {
      clients = _clientRepo.loadClients();
    } else if (event is AddClientEvent) {
      clients = _clientRepo.addClient(event.client);
    } else if (event is RemoveClientEvent) {
      clients = _clientRepo.removeCliente(event.client);
    }
    _outputClientController.add(ClientSucessState(clients: clients));
  } */
}