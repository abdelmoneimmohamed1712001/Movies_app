import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets_manager/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';

import '../../../../../domain/entities/PopularEntity.dart';

class PopularItemWidget extends StatelessWidget {
  PopularEntity popularEntity;
  PopularItemWidget({super.key, required this.popularEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 460.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 410.w,
                height: 440.h,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    height: 350.h,
                    width: 412.w,
                    fit: BoxFit.cover,
                    imageUrl: 'https://image.tmdb.org/t/p/w500${popularEntity.backdropPath}',
                    imageBuilder: (context, imageProvider) => Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Image(image: imageProvider,

                      ),
                    ),
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle_fill,
                        size: 50,
                        color: Colors.white,
                      )),
                ],
              ),
              Positioned(
                  bottom: 20.h,
                  left: 20.w,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      CachedNetworkImage(
                        height: 250.h,
                        imageUrl: 'https://image.tmdb.org/t/p/w500${popularEntity.posterPath}',
                        imageBuilder: (context, imageProvider) => Padding(
                          padding: REdgeInsets.all(8.0),
                          child: Image(image: imageProvider,

                          ),
                        ),
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Positioned(
                        top: -9.h,
                        left: -10.w,
                        child: Opacity(
                          opacity: .9,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark,
                                size: 50,
                                color: ColorsManager.lightGrey,
                              )),
                        ),
                      ),
                      Padding(
                        padding: REdgeInsets.all(10.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
              Positioned(
                top: 340.h,
                left: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularEntity.title ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(popularEntity.releaseDate ?? '',
                            style: Theme.of(context).textTheme.titleSmall),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text((popularEntity.voteAverage ?? '').toString(),
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
