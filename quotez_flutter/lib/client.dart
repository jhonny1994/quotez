import 'package:quotez_client/quotez_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

Client client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();
