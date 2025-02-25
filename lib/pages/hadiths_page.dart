import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/manager/state.dart';
import 'package:koran_app/presentation/widgets/custom_app_bar.dart';

import '../presentation/widgets/custom_hadith_card.dart';
import '../utils/colors.dart';

class HadithsPage extends StatefulWidget {
  final String id;

  const HadithsPage({super.key, required this.id});

  @override
  State<HadithsPage> createState() => _HadithsPageState();
}

class _HadithsPageState extends State<HadithsPage> {
  @override
  void initState() {
    super.initState();
    context.read<HadithCubit>().getHadiths(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithCubit, AppState>(builder: (context, state) {
      if (state is SuccessHadithState) {
        return Scaffold(
          appBar: CustomAppBar(title: widget.id),
          body: ListView.builder(
            itemCount: state.hadithsModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child:
                    CustomHadithCard(hadithsModel: state.hadithsModel[index]),
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
