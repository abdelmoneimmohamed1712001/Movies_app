import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/colors_manager/colors_manager.dart';
import 'package:movies_app/domain/entities/ReleasesEntity.dart';

import '../../../../domain/entities/SimilarEntity.dart';

class SimilarItemWidget extends StatelessWidget {
  SimilarEntity similarEntity;
  SimilarItemWidget({super.key,required this.similarEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 120,
      child: Card(
        color: ColorsManager.darkGrey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                CachedNetworkImage(
                  imageUrl: 'https://image.tmdb.org/t/p/w500${similarEntity.posterPath}',
                  imageBuilder: (context, imageProvider) => Image(image: imageProvider,

                  ),
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Positioned(
                    left: -9,
                    top: -6,
                    child: Opacity(
                        opacity: .8,
                        child: Icon(Icons.bookmark,color: Colors.grey,size: 40,))),
                Positioned(

                    child: Opacity(
                        opacity: .8,
                        child: Icon(Icons.add,color: Colors.white,size: 20,))),

              ],
            ),
            Padding(
              padding: REdgeInsets.all(4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: ColorsManager.goldColor,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    (similarEntity.voteAverage?.toStringAsFixed(1) ?? '').toString(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 12.sp
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:REdgeInsets.all(4.0),
              child: Text(similarEntity.title??'',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 13.sp
              ),maxLines: 2,),
            ),
            Padding(
              padding: REdgeInsets.all(4.0),
              child: Text(similarEntity.releaseDate??'',style: Theme.of(context).textTheme.titleSmall),
            ),


          ],
        ),
      ),
    );
  }
}
