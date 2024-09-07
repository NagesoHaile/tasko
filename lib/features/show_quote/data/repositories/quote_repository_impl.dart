import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tasko/core/resources/data_state.dart';
import 'package:tasko/features/show_quote/data/data_sources/quote_api_service.dart';
import 'package:tasko/features/show_quote/data/models/quote.dart';
import 'package:tasko/features/show_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteApiService quoteApiService;
  QuoteRepositoryImpl({required this.quoteApiService});
  @override
  Future<DataState<Quote>> getQuotes() async {
    final httpResponse = await quoteApiService.getQuotes();
    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
