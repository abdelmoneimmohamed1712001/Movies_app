import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets_manager/assets_manager.dart';
import 'package:movies_app/domain/entities/CategoriesEntity.dart';

class BrowseItemWidget extends StatelessWidget {
  CategoriesEntity categoriesEntity;
  BrowseItemWidget({super.key,required this.categoriesEntity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 170.h,
          width: 170.w,
          child: Image.asset(AssetsManager.category,width: 170.w,height: 170.h,fit: BoxFit.cover,),
        ),
        Text(categoriesEntity.name??'',style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600
        ),)
      ],
    );
  }
}
