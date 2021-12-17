import 'package:ecommerce_model/app/modules/home/home_model.dart';
import 'package:ecommerce_model/app/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class StaggeredTab extends GetView<HomeController> {
  StaggeredTab(this.items);
  final List<Home>? items;

  @override
  Widget build(BuildContext context) {
    return
        // StaggeredGridView.countBuilder(
        //     padding: EdgeInsets.zero,
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     crossAxisCount: 4,
        //     itemCount: items!.length,
        //     itemBuilder: (_, index) {
        //       return item(items![index]);
        //     },
        //     staggeredTileBuilder: (index) =>
        //         StaggeredTile.count(index, index.isEven ? 2 : 1),
        //     mainAxisSpacing: 4,
        //     crossAxisSpacing: 4);
        StaggeredGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      staggeredTiles: items!.map((doc) {
        return StaggeredTile.count(
            doc.eixoX, double.parse(doc.eixoY.toString()));
      }).toList(),
      children: items!.map((doc) {
        return ImageWidget(image: doc.image, fit: BoxFit.cover);
      }).toList(),
    );
  }

  item(Home items) {
    return AspectRatio(
        aspectRatio: 1.3,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: ImageWidget(
            image: items.image,
            fit: BoxFit.cover,
          ),
        ));
  }
}
