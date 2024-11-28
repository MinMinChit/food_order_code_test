import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_order_test/features/home/presentation/widgets/phone_number_dialog.dart';

import '../../../../constants/color_style.dart';
import '../../../../widgets/cache_network_image.dart';
import '../../../../widgets/shimmer_widget.dart';
import '../../data/models/menu_model.dart';
import '../bloc/menu/menu_cubit.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (BuildContext context, state) {
        switch (state) {
          case MenuInitial():
            return const SizedBox.shrink();
          case MenuLoading():
            return ShimmerWidget(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Passion Yogurt',
                                    style: KStyle.tTextMain.copyWith(
                                      color: KStyle.cBlack,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '5,000 Ks',
                                    style: KStyle.tTextMain.copyWith(
                                      color: KStyle.cBlack,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Natural fermented yogurt from pure fresh milk and passion fruit....',
                                    style: KStyle.tHint,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              children: [
                                Container(
                                  width: 83,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: KStyle.cWhite,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  height: 30,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'ORDER NOW',
                                      style: KStyle.tButton.copyWith(
                                        color: KStyle.cWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(height: 1),
                      ],
                    ),
                  );
                },
              ),
            );
          case MenuSuccess():
            List<MenuModel> menuList = state.menuList;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: menuList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                MenuModel menuModel = menuList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menuModel.strMeal,
                                  style: KStyle.tTextMain.copyWith(
                                    color: KStyle.cBlack,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '5,000 Ks',
                                  style: KStyle.tTextMain.copyWith(
                                    color: KStyle.cBlack,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Natural fermented yogurt from pure fresh milk and passion fruit....',
                                  style: KStyle.tHint,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            children: [
                              CacheNetworkImageWidget(
                                url: menuModel.strMealThumb,
                                height: 90,
                                width: 83,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                height: 30,
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const PhoneNumberDialog();
                                        });
                                  },
                                  child: Text(
                                    'ORDER NOW',
                                    style: KStyle.tButton.copyWith(
                                      color: KStyle.cWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(height: 1),
                    ],
                  ),
                );
              },
            );
          case MenuFail():
            return Text(state.message);
        }
      },
    );
  }
}
