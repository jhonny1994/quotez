import 'package:quotez_client/quotez_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'client.g.dart';

@riverpod
Client client(ClientRef ref) {
  return Client('https://f4s12l97-8080.euw.devtunnels.ms/')
    ..connectivityMonitor = FlutterConnectivityMonitor();
}
