import 'package:fpdart/fpdart.dart';
import 'package:quotez/config/client.dart';
import 'package:quotez_client/quotez_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'tag_notifier.g.dart';

@riverpod
Future<Either<String, List<Tag>>> tagList(TagListRef ref) async {
  final request = await ref.read(clientProvider).tag.list();
  if (request != null) {
    return right(request);
  } else {
    return left('No tags found');
  }
}
