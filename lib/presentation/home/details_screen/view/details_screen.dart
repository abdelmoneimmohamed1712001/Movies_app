import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';
import 'package:movies_app/presentation/home/details_screen/widgets/similar_list_widget.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/movies_screen/widgets/movies_list_widget.dart';

import '../../../../../../core/DI/di.dart';
import '../view_model/details_tab_view_model.dart';
import '../widgets/details_list_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String movieId = args['id']!;
    final String movieTitle = args['title']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(movieTitle),
        backgroundColor: ColorsManager.darkGrey,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => getIt<DetailsTabViewModel>(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: DetailsListWidget(movieId: movieId),
            ),
      SliverToBoxAdapter(
          child: Container(
            padding: REdgeInsets.all(10),

            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorsManager.middleGrey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('More Like This',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 15.sp
                ),),
                SimilarListWidget(movieId: movieId),
              ],
            ),
          )
      ),
     ]),
      ),
    );
  }
}
