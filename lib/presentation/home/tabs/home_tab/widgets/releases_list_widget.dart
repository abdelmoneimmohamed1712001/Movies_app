import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/widgets/releases_item_widget.dart';

import '../view_model/home_tab_view_model.dart';

class ReleasesListWidget extends StatefulWidget {
  const ReleasesListWidget({super.key});

  @override
  State<ReleasesListWidget> createState() => _ReleasesListWidgetState();
}

class _ReleasesListWidgetState extends State<ReleasesListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final HomeTabViewModel viewModel =
          BlocProvider.of<HomeTabViewModel>(context);
      viewModel.getReleases();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel,HomeTabState>(
      buildWhen: (prevState, currentState) {
        if(currentState is ReleasesSuccessState){
          return true;
        }
        return false;
      },
      listenWhen: (prevState, currentState) {
        if(currentState is ReleasesErrorState){
          return true;
        }
        if(currentState is ReleasesLoadingState){
          return true ;
        }
        if(currentState is ReleasesSuccessState){
          return true ;
        }
        return false;
      },
      builder: (context, state) {
        if (state is ReleasesSuccessState) {
          return Center(
            child: SizedBox(
              height: 190.h,

              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                itemBuilder: (context, index) => ReleasesItemWidget(releasesEntity: state.releases[index]),
                itemCount: state.releases.length,
              ),
            ),
          );
        }
        return Container();
      },
      listener: (context, state) {
        if(state is ReleasesLoadingState){
          showDialog(
            context: context,
            builder: (context) =>Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(child: CircularProgressIndicator(),),
                      ],
                    ),
                  ),
                ],
              ),
            ),);
        }
        if(state is ReleasesErrorState){
          showDialog(context: context,
            builder: (context) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AlertDialog(
                    content: Center(child: Text(state.error.toString()),),
                  ),
                ],
              ),
            ),);
        }
        if(state is ReleasesSuccessState){
          Navigator.pop(context);
        }
      },
    );
  }
}
