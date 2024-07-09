import 'package:fpdart/fpdart.dart';
import 'package:quotez/config/client.dart';
import 'package:quotez_client/quotez_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'author_notifier.g.dart';

@riverpod
Future<Either<String, AuthorsResult>> authorList(AuthorListRef ref) async {
  final request = await ref.read(clientProvider).author.list();
  if (request != null) {
    return right(request);
  } else {
    return left('No authors found');
  }
}
