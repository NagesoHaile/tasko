import 'package:tasko/core/resources/data_state.dart';
import 'package:tasko/features/show_quote/data/models/quote.dart';

abstract class QuoteRepository {
  Future<DataState<Quote>> getQuotes();
}
