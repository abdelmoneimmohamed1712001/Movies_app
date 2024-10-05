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
      width: 410.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              // CachedNetworkImage(
              //   height: 217.h,
              //   imageUrl: popularEntity.posterPath ??'',
              //   imageBuilder: (context, imageProvider) => CircleAvatar(
              //     backgroundImage: imageProvider,
              //     radius: 0,
              //   ),
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              Container(
                width: 410.w,
                height: 350.h,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetsManager.dora,
                    width: double.infinity,
                    height: 217.h,
                    fit: BoxFit.cover,
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
                  top: 120.h,
                  left: 20.w,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.asset(AssetsManager.dora2),
                      Positioned(
                        top: -17.h,
                        left: -17.w,
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
                        padding: REdgeInsets.all(4.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
              Positioned(
                top: 260.h,
                left: 160.w,
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
