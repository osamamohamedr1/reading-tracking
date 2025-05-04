import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reading_tracker/features/books/data/repos/books_repo.dart';
import 'package:reading_tracker/features/books/logic/cubit/book_cubit.dart';
import 'package:reading_tracker/features/books/presentation/views/pdf_view_screen.dart';

class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit(BooksRepo())..fetchPdfFiles(),
      child: Scaffold(
        body: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            if (state is BookFailure) {
              return Center(child: Text(state.errorMessage));
            } else if (state is BookSuccess) {
              if (state.pdfList.isEmpty) {
                return RefreshIndicator(
                  onRefresh: () {
                    return context.read<BookCubit>().fetchPdfFiles();
                  },
                  child: ListView(
                    children: [
                      const Center(
                        child: Text("لا توجد ملفات PDF"),
                      ),
                    ],
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () {
                  return context.read<BookCubit>().fetchPdfFiles();
                },
                child: ListView.builder(
                  itemCount: state.pdfList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        String filePath = state.pdfList[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfViewScreen(
                                path: filePath.toString(),
                              ),
                            ));
                      },
                      title: Text(state.pdfList[index].split("/").last),
                      subtitle: Text(state.pdfList[index]),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                  child: Text("Scanning your device for books..."));
            }
          },
        ),
      ),
    );
  }
}
