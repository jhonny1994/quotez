import 'package:fpdart/fpdart.dart';
import 'package:quotez/config/client.dart';
import 'package:quotez_client/quotez_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'random_quote_notifier.g.dart';

@riverpod
Future<Either<String, Quote>> randomQuote(
  RandomQuoteRef ref, {
  String? tag,
}) async {
  final request = await ref
      .read(clientProvider)
      .quote
      .random(tags: tag != null ? [tag] : null);
  if (request != null) {
    return right(request.first);
  } else {
    return left('No tags found');
  }
}
