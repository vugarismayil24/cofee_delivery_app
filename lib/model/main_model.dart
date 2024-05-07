import 'coffee_model.dart';

class MainModel {
  final List<CoffeeModel> americano;
  final List<CoffeeModel> cappucino;
  final List<CoffeeModel> espresso;
  final List<CoffeeModel> latte;
  final List<CoffeeModel> turkish;
  final List<CoffeeModel> machiato;
  final List<CoffeeModel> mocha;

  MainModel(
      {required this.americano,
      required this.cappucino,
      required this.espresso,
      required this.latte,
      required this.turkish,
      required this.machiato,
      required this.mocha});

  factory MainModel.fromJson(Map<String, dynamic> json) {
    final model = MainModel(
      americano: List<CoffeeModel>.from(
          json['americano'].map((e) => CoffeeModel.fromJson(e))),
      cappucino: List<CoffeeModel>.from(
          json['cappucino'].map((e) => CoffeeModel.fromJson(e))),
      espresso: List<CoffeeModel>.from(
          json['espresso'].map((e) => CoffeeModel.fromJson(e))),
      latte: List<CoffeeModel>.from(
          json['latte'].map((e) => CoffeeModel.fromJson(e))),
      turkish: List<CoffeeModel>.from(
          json['turkish'].map((e) => CoffeeModel.fromJson(e))),
      machiato: List<CoffeeModel>.from(
          json['machiato'].map((e) => CoffeeModel.fromJson(e))),
      mocha: List<CoffeeModel>.from(
          json['mocha'].map((e) => CoffeeModel.fromJson(e))),
    );
    return model;
  }
}
