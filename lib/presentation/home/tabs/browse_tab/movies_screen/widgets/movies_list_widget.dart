import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/CategoriesEntity.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/widgets/browse_item_widget.dart';

import '../../../../../../core/utils/routes_manager/routes_manager.dart';
import '../view_model/movies_tab_view_model.dart';
import 'movies_item_widget.dart';

class MoviesListWidget extends StatefulWidget {
  final String categoryId;
  MoviesListWidget({required this.categoryId});

  @override
  State<MoviesListWidget> createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final MoviesTabViewModel viewModel =
          BlocProvider.of<MoviesTabViewModel>(context);
      viewModel.getCategories(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesTabViewModel, MoviesTabState>(
      buildWhen: (prevState, currentState) {
        if(currentState is MoviesSuccessState){
          return true;
        }
        return false;
      },
      listenWhen: (prevState, currentState) {
        if(currentState is MoviesErrorState){
          return true;
        }
        if(currentState is MoviesLoadingState){
          return true ;
        }
        if(currentState is MoviesSuccessState){
          return true ;
        }
        return false;
      },
      builder: (context, state) {
        if (state is MoviesSuccessState) {
          return SizedBox(
            height: 900.h,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.movies.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 0),
                  itemBuilder:(context, index) => InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.detailsRoute,arguments: {
                          'id': state.movies[index].id.toString(),
                          'title': state.movies[index].title.toString(),
                        });
                      },
                      child: MoviesItemWidget(moviesEntity: state.movies[index]))),
            ),
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is MoviesLoadingState) {
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
        if (state is MoviesErrorState) {
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
        if (state is MoviesSuccessState) {
          Navigator.pop(context);
        }
      },
    );
  }
}
