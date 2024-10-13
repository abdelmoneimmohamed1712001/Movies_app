import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/widgets/popular_item_widget.dart';

import '../../../../../core/utils/routes_manager/routes_manager.dart';
import '../view_model/home_tab_view_model.dart';

class PopularListWidget extends StatefulWidget {
  const PopularListWidget({super.key});

  @override
  State<PopularListWidget> createState() => _PopularListWidgetState();
}

class _PopularListWidgetState extends State<PopularListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     final HomeTabViewModel viewModel = BlocProvider.of<HomeTabViewModel>(context);
      viewModel.getPopular();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel,HomeTabState>(
      buildWhen: (prevState, currentState) {
        if(currentState is PopularSuccessState){
          return true;
        }
        return false;
      },
      listenWhen: (prevState, currentState) {
        if(currentState is PopularErrorState){
          return true;
        }
        if(currentState is PopularLoadingState){
          return true ;
        }
        if(currentState is PopularSuccessState){
          return true ;
        }
        return false;
      },
      builder: (context, state) {
        if(state is PopularSuccessState){
          // return SizedBox(
          //   height:300.h,
          //   child: GridView.builder(
          //       scrollDirection: Axis.horizontal,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          //       itemBuilder: (context, index) => PopularItemWidget(popularEntity: state.popular[index]),
          //       itemCount: state.popular.length),
          // );
        return  CarouselSlider.builder(
              itemCount: state.popular.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesManager.detailsRoute,arguments: {
                          'id': state.popular[itemIndex].id.toString(),
                          'title': state.popular[itemIndex].title.toString(),
                        });
                      },
                      child: PopularItemWidget(popularEntity: state.popular[itemIndex])),
              options: CarouselOptions(
                height: 510.h,
                aspectRatio: 16/9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {

                },
                scrollDirection: Axis.horizontal,
              )
          );
        }
        return Container();
      },
      listener: (context, state) {
        if(state is PopularLoadingState){
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
        if(state is PopularErrorState){
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
        if(state is PopularSuccessState){
          Navigator.pop(context);
        }
      },);
  }
}
