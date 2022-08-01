import 'package:app_bloc_2022/model/client.dart';

abstract class ClientEvent {

}

class LoadClientEvent extends ClientEvent{

}

class AddClientEvent extends ClientEvent {
  Client client;

  AddClientEvent({required this.client});
}

class RemoveClientEvent extends ClientEvent {
  Client client;

  RemoveClientEvent({required this.client});
}