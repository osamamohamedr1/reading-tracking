import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reading_tracker/features/books/data/repos/books_repo.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit(this.booksRepo) : super(BookInitial());

  final BooksRepo booksRepo;

  Future<void> fetchPdfFiles() async {
    emit(BookLoading());

    final result = await booksRepo.getAllPdfFiles();

    result.fold(
      (failure) => emit(BookFailure(errorMessage: failure.errorMessage)),
      (pdfFiles) => emit(BookSuccess(pdfList: pdfFiles)),
    );
  }
}
