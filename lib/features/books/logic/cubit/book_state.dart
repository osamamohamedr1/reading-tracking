part of 'book_cubit.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}

final class BookLoading extends BookState {}

final class BookFailure extends BookState {
  final String errorMessage;

  BookFailure({required this.errorMessage});
}

class BookRefreshing extends BookState {
  final List<String> oldPdfList;
  BookRefreshing({required this.oldPdfList});
}

final class BookSuccess extends BookState {
  final List<String> pdfList;

  BookSuccess({required this.pdfList});
}
