import 'package:cached_network_image/cached_network_image.dart';
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
                  CachedNetworkImage(
                    height: 150.h,
                    imageUrl: 'https://image.tmdb.org/t/p/w500${moviesEntity.posterPath}',
                    imageBuilder: (context, imageProvider) => Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Image(image: imageProvider,

                      ),
                    ),
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Positioned(
                      top: 3.h,
                      left: -1.w,
                      child: Icon(Icons.bookmark,color: Colors.grey,size: 40,)),
                  Positioned(
                      top: 10.h,
                      left: 5.w,
                      child: Icon(Icons.add,color: Colors.white,))
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
