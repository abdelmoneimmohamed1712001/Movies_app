import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/ReleasesEntity.dart';

class ReleasesItemWidget extends StatelessWidget {
  ReleasesEntity releasesEntity;
  ReleasesItemWidget({super.key,required this.releasesEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.w,
      height: 127,
      child: Card(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500${releasesEntity.posterPath}',
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
                    child: Icon(Icons.add,color: Colors.white,size: 20,))),],
        )

      ),
    );
  }
}
