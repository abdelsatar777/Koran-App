import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/manager/state.dart';
import 'package:koran_app/presentation/widgets/custom_app_bar.dart';
import '../presentation/widgets/custom_books_hadiths_card.dart';
import '../utils/colors.dart';

class BooksHadithsPage extends StatefulWidget {
  const BooksHadithsPage({super.key});

  @override
  State<BooksHadithsPage> createState() => _BooksHadithsPageState();
}

class _BooksHadithsPageState extends State<BooksHadithsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithCubit, AppState>(builder: (context, state) {
      if (state is SuccessBookHadithState) {
        return Scaffold(
          appBar: CustomAppBar(title: "كتب الاحاديث"),
          body: ListView.builder(
            itemCount: state.bookHadithsModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: CustomBooksHadithsCard(
                  bookHadithsModel: state.bookHadithsModel[index],
                ),
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
    });
  }
}
