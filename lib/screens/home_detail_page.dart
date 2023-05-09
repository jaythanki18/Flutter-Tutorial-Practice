import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar:  Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH0,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(key: Key(" "), catalog: catalog).wh(120,50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 10.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP, child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl.color(context.accentColor).bold.make(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                        10.heightBox,
                        "Et vero lorem clita voluptua nonumy dolor. Est kasd dolores et amet dolores, stet lorem ipsum sanctus sed et voluptua lorem, magna diam lorem ipsum duo et et dolor ea dolor. Et ipsum invidunt magna tempor elitr eirmod, at et at dolor erat sit dolor labore et duo. Voluptua et.".text.textStyle(context.captionStyle).make().p16()
                      ],
                  ).py64(),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
