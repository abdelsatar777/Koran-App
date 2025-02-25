import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koran_app/manager/cubit.dart';
import 'package:koran_app/manager/state.dart';
import 'package:koran_app/presentation/widgets/custom_khotab_card.dart';

import '../../utils/colors.dart';
import '../widgets/custom_app_bar.dart';

class KhotabScreen extends StatefulWidget {
  const KhotabScreen({super.key});

  @override
  State<KhotabScreen> createState() => _KhotabScreenState();
}

class _KhotabScreenState extends State<KhotabScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KhotabCubit, AppState>(
      builder: (context, state) {
        if (state is SuccessKhotabState) {
          return Scaffold(
            appBar: CustomAppBar(title: "الخطب", hideIcon: true),
            body: ListView.builder(
              itemCount: state.khotab.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomKhotabCard(khotabModel: state.khotab[index]),
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
