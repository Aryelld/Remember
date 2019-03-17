import 'package:flutter/material.dart';
import 'pages/primeiroAcessoPage.dart';
import 'pages/inicialPage.dart';
import 'pages/adicionaStoriePage.dart';
import 'pages/visualizaStories.dart';

Map<String, StatelessWidget Function(BuildContext)> routes(primeiroAcesso) {
  return {
    '/' : (BuildContext context) => primeiroAcesso ? PrimeiroAcessoPage() : InicialPage(),
    '/addStorie' : (BuildContext context) => AdicionaStoriePage(),
    '/visualizaStories' : (BuildContext context) => VisualizaStoriesPage()
  };
}
