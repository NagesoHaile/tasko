import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tasko/core/resources/data_state.dart';
import 'package:tasko/features/show_quote/data/models/quote.dart';
import 'package:tasko/features/show_quote/domain/use_cases/quote_use_case.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteUseCase quoteUseCase;
  QuoteBloc(this.quoteUseCase) : super(QuoteInitial()) {
    on<QuoteEvent>(quoteEventHandler);
  }

  FutureOr<void> quoteEventHandler(
    QuoteEvent event,
    Emitter<QuoteState> emit,
  ) async {
    try {
      final dataState = await quoteUseCase.getQuotes();
      if (dataState is DataSuccess && dataState.data != null) {
        emit(QuoteFetched(quotes: dataState.data!));
      }
    } on DioException catch (e) {
      emit(QuoteFailed(
          errorMessage: e.response?.data['message'] ?? "Something went wrong"));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
