import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/movies_screen/widgets/movies_list_widget.dart';

import '../../../../../../core/DI/di.dart';
import '../view_model/movies_tab_view_model.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String categoryId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: ColorsManager.darkGrey,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => getIt<MoviesTabViewModel>(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: MoviesListWidget(categoryId: categoryId),
            ),
          ],
        ),
      ),
    );
  }
}
