import 'package:app_bloc_2022/model/client.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(nome: 'José Armando'),
      Client(nome: 'Anastácia Silva'),
      Client(nome: 'Marineiva Souza'),
      Client(nome: 'Bruno Paiva'),
    ]);
    return _clients;
  }

  List<Client> addClient(Client client){
    _clients.add(client);
    return _clients;
  }

  List<Client> removeCliente(Client client){
    _clients.remove(client);
    return _clients;
  }

}

