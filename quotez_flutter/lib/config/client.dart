import 'package:quotez_client/quotez_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'client.g.dart';

@riverpod
Client client(ClientRef ref) {
  return Client('http://$localhost:8080/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
}
