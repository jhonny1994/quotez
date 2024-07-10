// ignore_for_file: avoid_void_async

import 'dart:io';

import 'package:quotez_server/src/generated/endpoints.dart';
import 'package:quotez_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

final port = int.parse(Platform.environment['PORT'] ?? '8080');
final config = ServerConfig(
  port: port,
  publicScheme: 'http',
  publicHost: 'localhost',
  publicPort: port,
);

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    config: ServerpodConfig(apiServer: config),
    Protocol(),
    Endpoints(),
  );

  await pod.start();
}
