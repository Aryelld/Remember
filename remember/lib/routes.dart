import 'package:flutter/material.dart';
import 'pages/primeiroAcessoPage.dart';
import 'pages/inicialPage.dart';
import 'pages/adicionaStoriePage.dart';
import 'pages/visualizaStories.dart';

Map<String, StatelessWidget Function(BuildContext)> routes(primeiroAcesso) {
  return {
    '/visualizaStories' : (BuildContext context) => VisualizaStoriesPage(),
    '/addStorie' : (BuildContext context) => AdicionaStoriePage(),
    '/inicio' : (BuildContext context) => InicialPage(),
    '/' : (BuildContext context) => primeiroAcesso ? PrimeiroAcessoPage() : InicialPage(),
  };
}
