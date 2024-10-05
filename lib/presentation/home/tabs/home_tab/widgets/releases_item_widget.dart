import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/ReleasesEntity.dart';

class ReleasesItemWidget extends StatelessWidget {
  ReleasesEntity releasesEntity;
  ReleasesItemWidget({super.key,required this.releasesEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 128.h,
          imageUrl: releasesEntity.posterPath ??'',
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
            radius: 0,
          ),
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(releasesEntity.title??'',style: TextStyle(color: Colors.white),),

      ],
    );
  }
}
