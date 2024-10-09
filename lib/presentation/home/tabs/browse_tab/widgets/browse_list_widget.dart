import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/routes_manager/routes_manager.dart';
import 'package:movies_app/domain/entities/CategoriesEntity.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/widgets/browse_item_widget.dart';

class BrowseListWidget extends StatefulWidget {


  @override
  State<BrowseListWidget> createState() => _BrowseListWidgetState();
}

class _BrowseListWidgetState extends State<BrowseListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final BrowseTabViewModel viewModel =
          BlocProvider.of<BrowseTabViewModel>(context);
      viewModel.getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrowseTabViewModel, BrowseTabState>(
      buildWhen: (prevState, currentState) {
        if(currentState is BrowseSuccessState){
          return true;
        }
        return false;
      },
      listenWhen: (prevState, currentState) {
        if(currentState is BrowseErrorState){
          return true;
        }
        if(currentState is BrowseLoadingState){
          return true ;
        }
        if(currentState is BrowseSuccessState){
          return true ;
        }
        return false;
      },
      builder: (context, state) {
        if (state is BrowseSuccessState) {
          return SizedBox(
            height: 800.h,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.categories.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 0),
                  itemBuilder:(context, index) => InkWell(
                      onTap: () {
                        print(state.categories[index].id);
                        Navigator.pushNamed(context, RoutesManager.moviesRoute,arguments: state.categories[index].id.toString());
                      },
                      child: BrowseItemWidget(categoriesEntity: state.categories[index]))),
            ),
          );
        }
        return Container();
      },
      listener: (context, state) {
        if (state is BrowseLoadingState) {
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
        if (state is BrowseErrorState) {
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
        if (state is BrowseSuccessState) {
          Navigator.pop(context);
        }
      },
    );
  }
}
