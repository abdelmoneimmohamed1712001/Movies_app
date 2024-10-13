import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/CategoriesEntity.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/widgets/browse_item_widget.dart';

import '../view_model/details_tab_view_model.dart';
import 'details_item_widget.dart';

class DetailsListWidget extends StatefulWidget {
  final String movieId;
  DetailsListWidget({required this.movieId});

  @override
  State<DetailsListWidget> createState() => _DetailsListWidgetState();
}

class _DetailsListWidgetState extends State<DetailsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final DetailsTabViewModel viewModel =
          BlocProvider.of<DetailsTabViewModel>(context);
      viewModel.getDetails(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsTabViewModel, DetailsTabState>(
      buildWhen: (prevState, currentState) {
        if(currentState is DetailsSuccessState){
          return true;
        }
        return false;
      },
      listenWhen: (prevState, currentState) {
        if(currentState is DetailsErrorState){
          return true;
        }
        if(currentState is DetailsLoadingState){
          return true ;
        }
        if(currentState is DetailsSuccessState){
          return true ;
        }
        return false;
      },
      builder: (context, state) {
        if (state is DetailsSuccessState) {
          return Container(
            height: 570.h,
            child: DetailsItemWidget(detailsEntity: state.details,),
          );

        }
        return Container();
      },
      listener: (context, state) {
        if (state is DetailsLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is DetailsErrorState) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AlertDialog(
                    content: Center(
                      child: Text(state.error.toString()),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is DetailsSuccessState) {
          Navigator.pop(context);
        }
      },
    );
  }
}
