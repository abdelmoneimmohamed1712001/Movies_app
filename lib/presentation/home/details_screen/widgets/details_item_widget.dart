import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';
import 'package:movies_app/domain/entities/DetailsEntity.dart';

class DetailsItemWidget extends StatelessWidget {
  DetailsEntity detailsEntity;
  DetailsItemWidget({super.key, required this.detailsEntity});

  @override
  Widget build(BuildContext context) {
    print('detailsEntity.overview');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              height: 282.h,
              width: 420.w,
              fit: BoxFit.cover,
              imageUrl:
                  'https://image.tmdb.org/t/p/w500${detailsEntity.backdropPath}',
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
              ),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
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
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 30.0),
          child: Text(detailsEntity.title ?? '',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            detailsEntity.releaseDate ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 190.h,
              width: 150.w,
              fit: BoxFit.cover,
              imageUrl:
                  'https://image.tmdb.org/t/p/w500${detailsEntity.posterPath}',
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
              ),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                      height: 50,
                      child: GridView.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        padding: EdgeInsets.all(10.0),
                        physics: NeverScrollableScrollPhysics(),

                        shrinkWrap: true,
                        children: List.generate(detailsEntity.genres!.length, (index) {
                          return Container(
                            child: Text(
                              detailsEntity.genres?[index].name??'',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          );
                        }),
                      )),
                  Text(
                    detailsEntity.overview ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorsManager.goldColor,
                        size: 35,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        (detailsEntity.voteAverage?.toStringAsFixed(1) ?? '').toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
