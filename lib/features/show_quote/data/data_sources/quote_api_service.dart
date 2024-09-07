import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasko/features/show_quote/data/models/quote.dart';
part 'quote_api_service.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/quotes/random')
abstract class QuoteApiService {
  factory QuoteApiService(Dio dio) = _QuoteApiService;

  @GET('')
  Future<HttpResponse<Quote>> getQuotes();
}
