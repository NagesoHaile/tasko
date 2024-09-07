// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quote_bloc.dart';

class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteInitial extends QuoteState {}

class QuoteFetched extends QuoteState {
  final Quote quotes;
  const QuoteFetched({
    required this.quotes,
  });
}

class QuoteLoading extends QuoteState {}

class QuoteFailed extends QuoteState {
  final String errorMessage;
  const QuoteFailed({required this.errorMessage});
}
