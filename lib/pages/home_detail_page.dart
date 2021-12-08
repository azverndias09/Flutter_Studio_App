import 'package:flutter/material.dart';
import 'package:gram_clone/models/catalog.dart';
import 'package:gram_clone/pages/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

import 'widgets/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.imgurl),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(MyTheme.darkBluishColor)
                            .bold
                            .make(),
                        catalog.desc.text.lg
                            .color(MyTheme.darkBluishColor)
                            .xl
                            .make(),
                        10.heightBox,
                        "Accusam sit at dolor justo sea kasd invidunt ut. Dolores diam sit sea ipsum rebum. Justo et vero ipsum sed sed ipsum, sit est ipsum eos est, tempor et tempor erat labore justo ipsum gubergren justo duo, dolore est sit aliquyam sea ut. Nonumy rebum diam clita vero amet diam."
                            .text
                            .make()
                            .p16(),
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
