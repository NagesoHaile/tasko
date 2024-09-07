import 'package:tasko/core/resources/data_state.dart';
import 'package:tasko/features/show_quote/data/models/quote.dart';
import 'package:tasko/features/show_quote/domain/repositories/quote_repository.dart';

class QuoteUseCase {
  final QuoteRepository quoteRepository;
  const QuoteUseCase({required this.quoteRepository});
  Future<DataState<Quote>> getQuotes() async {
    return await quoteRepository.getQuotes();
  }
}
