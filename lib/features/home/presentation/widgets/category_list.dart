import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_test/constants/color_style.dart';
import 'package:food_order_test/features/home/presentation/bloc/menu/menu_cubit.dart';

import '../../../../widgets/cache_network_image.dart';
import '../../../../widgets/custom_container.dart';
import '../../../../widgets/shimmer_widget.dart';
import '../../data/models/category_model.dart';
import '../bloc/category/category_cubit.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 61,
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (BuildContext context, state) {
          if (state is CategorySuccess) {
            List<CategoryModel> categoryList = state.categoryList;
            if (categoryList.isNotEmpty) {
              context
                  .read<MenuCubit>()
                  .getMenuByCategory(state.selectedCategory!.strCategory);
            }
          }
        },
        builder: (BuildContext context, state) {
          switch (state) {
            case CategoryInitial():
              return const SizedBox.shrink();
            case CategoryLoading():
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const ShimmerWidget(
                    child: InnerShadowContainer(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(right: 8),
                    ),
                  );
                },
              );
            case CategorySuccess():
              List<CategoryModel> categoryList = state.categoryList;
              CategoryModel? selectedCategory = state.selectedCategory;
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  CategoryModel categoryModel = categoryList[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    height: 61,
                    width: 61,
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<CategoryCubit>()
                            .selectCategory(categoryModel);
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: InnerShadowContainer(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CacheNetworkImageWidget(
                                    url: categoryModel.strCategoryThumb,
                                    height: 28,
                                    width: 28,
                                    boxFit: BoxFit.contain,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      categoryModel.strCategory,
                                      style: KStyle.tTiny.copyWith(
                                        color: KStyle.cGray,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          selectedCategory == categoryModel
                              ? Container(
                                  width: 61,
                                  height: 61,
                                  decoration: BoxDecoration(
                                    borderRadius: SmoothBorderRadius(
                                      cornerRadius: 8,
                                      cornerSmoothing: 0.9,
                                    ),
                                    border: Border.all(
                                      color: KStyle.cRed,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  );
                },
              );
            case CategoryFail():
              return Text(state.message);
          }
        },
      ),
    );
  }
}
