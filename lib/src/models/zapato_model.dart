import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetsImage = 'assets/azul.png';

  double _talla = 9.0;

  String get assetsImage => this._assetsImage;

  set assetsImage(String valor) {
    this.assetsImage = valor;
    notifyListeners();
  }

  double get talla => this._talla;

  set talla(double valor) {
    this._talla = valor;
    notifyListeners();
  }
}
