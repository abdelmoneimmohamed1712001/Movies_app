import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/widgets/browse_list_widget.dart';

import '../../../../../core/DI/di.dart';
import '../view_model/browse_tab_view_model.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BrowseTabViewModel>(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Padding(
            padding: REdgeInsets.only(left: 30,right:30 ,top: 30),
            child: Text('Browse Category',style: Theme.of(context).textTheme.titleLarge,),
          )),
          SliverToBoxAdapter(
            child: BrowseListWidget(),
          ),
        ],
      ),
    );
  }
}
