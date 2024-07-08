// ignore_for_file: avoid_void_async

import 'package:quotez_server/src/generated/endpoints.dart';
import 'package:quotez_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  await pod.start();
}
