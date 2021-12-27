import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widgets/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'zapato_1', child: ZapatoSizePreview(fullScreen: true)),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 50,
                  ),
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    changeStatusDark();

                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColorsAndMore(),
                  _BotonesLinkCartSettings(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonesLinkCartSettings extends StatelessWidget {
  const _BotonesLinkCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(Icon(Icons.shopping_cart_outlined,
              color: Colors.grey.withOpacity(.4), size: 25)),
          _BotonSombreado(Icon(Icons.settings,
              color: Colors.grey.withOpacity(.4), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon? icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10),
            )
          ]),
      child: this.icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 90,
                  child: _ButtonColor(Color(0xffc6d642), 4, 'assets/verde.png'),
                ),
                Positioned(
                  left: 60,
                  child:
                      _ButtonColor(Color(0xffffad29), 3, 'assets/amarillo.png'),
                ),
                Positioned(
                  left: 30,
                  child: _ButtonColor(Color(0xff2099f1), 2, 'assets/azul.png'),
                ),
                _ButtonColor(Color(0xff364d56), 1, 'assets/negro.png')
              ],
            ),
          ),
          BotonNaranja(
            texto: 'More releate items',
            alto: 30,
            ancho: 170,
            color: Colors.orange.withOpacity(.5),
          )
        ],
      ),
    );
  }
}

class _ButtonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String url;
  const _ButtonColor(this.color, this.index, this.url);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final controller = Provider.of<ZapatoModel>(context, listen: false);

          controller.assetsImage = this.url;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(
                ancho: 120,
                alto: 40,
                texto: 'Buy now',
              ),
            )
          ],
        ),
      ),
    );
  }
}
