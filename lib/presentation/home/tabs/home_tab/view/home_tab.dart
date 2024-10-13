import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/view_model/home_tab_view_model.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/widgets/popular_list_widget.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/widgets/releases_list_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeTabViewModel>(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PopularListWidget(),
          ),
          SliverToBoxAdapter(
             child: Container(
                padding: REdgeInsets.all(10),
                height: 240.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: ColorsManager.middleGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New Releases',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 15.sp
                    ),),
                    ReleasesListWidget(),
                  ],
                ),
              )
          ),
        ],
      )
    );
  }
}
