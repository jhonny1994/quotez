import 'package:dio/dio.dart';
import 'package:quotez_server/src/endpoints/constants.dart';
import 'package:quotez_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TagEndpoint extends Endpoint {
  Future<List<Tag>?> list(Session session) async {
    const tagsUrl = '/tags';

    try {
      final response = await dio.get<List<dynamic>>(tagsUrl);
      if (response.data != null) {
        final tags = response.data!
            .map(
              (e) => Tag.fromJson(e as Map<String, dynamic>).copyWith(
                id: e['_id'] as String,
              ),
            )
            .toList();
        return tags;
      } else {
        return null;
      }
    } on DioException {
      rethrow;
    }
  }
}
