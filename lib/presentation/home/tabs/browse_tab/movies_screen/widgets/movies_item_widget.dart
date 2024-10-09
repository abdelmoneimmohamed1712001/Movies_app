import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets_manager/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';
import '../../../../../../domain/entities/MoviesEntity.dart';

class MoviesItemWidget extends StatelessWidget {
  MoviesEntity moviesEntity;
  MoviesItemWidget({super.key,required this.moviesEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(

            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(AssetsManager.movie,width: 210.w,height: 150.h,),
                  Positioned(
                      top: 22.h,
                      left: 19.w,
                      child: Icon(Icons.bookmark,color: ColorsManager.goldColor,))
                ],
              ),
              Text(moviesEntity.title??'',style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        )
      ],
    );
  }
}
