import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/manager/state.dart';
import 'package:koran_app/presentation/widgets/custom_books_card.dart';

import '../../utils/colors.dart';
import '../widgets/custom_app_bar.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, AppState>(
      builder: (context, state) {
        if (state is SuccessBooksState) {
          return Scaffold(
            appBar: CustomAppBar(title: "كتب دينيه", hideIcon: true),
            body: ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomBooksCard(booksModel: state.books[index]),
                );
              },
            ),
          );
        } else if (state is ErrorState) {
          return Scaffold(
            body: Center(child: Text("Error: ${state.errorMassage}")),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
      },
    );
  }
}
