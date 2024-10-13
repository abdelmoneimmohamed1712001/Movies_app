import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/routes_manager/routes_manager.dart';
import 'package:movies_app/domain/entities/SimilarEntity.dart';
import 'package:movies_app/presentation/home/details_screen/view_model/details_tab_view_model.dart';
import 'package:movies_app/presentation/home/details_screen/widgets/similar_item_widget.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/widgets/releases_item_widget.dart';

class SimilarListWidget extends StatefulWidget {
  final String movieId;
  SimilarListWidget({super.key,required this.movieId});

  @override
  State<SimilarListWidget> createState() => _SimilarListWidgetState();
}

class _SimilarListWidgetState extends State<SimilarListWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final DetailsTabViewModel viewModel =
      BlocProvider.of<DetailsTabViewModel>(context);
      viewModel.getSimilar(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsTabViewModel,DetailsTabState>(
      buildWhen: (prevState, currentState) {
        if(currentState is SimilarSuccessState){
          return true;
        }
        return false;
      },
      listenWhen: (prevState, currentState) {
        if(currentState is SimilarErrorState){
          return true;
        }
        if(currentState is SimilarLoadingState){
          return true ;
        }
        if(currentState is SimilarSuccessState){
          return true ;
        }
        return false;
      },
      builder: (context, state) {
        if (state is SimilarSuccessState) {
          return Center(
            child: SizedBox(
              height: 300.h,
              child: ListView.builder(
                itemCount: state.similar.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesManager.detailsRoute,arguments: {
                      'id': state.similar[index].id.toString(),
                      'title': state.similar[index].title.toString(),
                    });
                  },
                  child: SimilarItemWidget(similarEntity: state.similar[index])),),
              // child: GridView.builder(
              //   scrollDirection: Axis.horizontal,
              //   gridDelegate:
              //   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              //   itemBuilder: (context, index) => InkWell(
              //       onTap: () {
              //         Navigator.pushNamed(context, RoutesManager.detailsRoute,arguments: {
              //           'id': state.similar[index].id.toString(),
              //           'title': state.similar[index].title.toString(),
              //         });
              //       },
              //       child: SimilarItemWidget(similarEntity: state.similar[index])),
              //   itemCount: state.similar.length,
              // ),
            ),
          );
        }
        return Container();
      },
      listener: (context, state) {
        if(state is SimilarLoadingState){
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
        if(state is SimilarErrorState){
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
        if(state is SimilarSuccessState){
          Navigator.pop(context);
        }
      },
    );
  }
}
