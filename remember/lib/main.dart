import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'reducer.dart';
import 'routes.dart';
import 'state.dart';

void main() async{

  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );
  
  final initialState = await persistor.load();

  final store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: [persistor.createMiddleware()],
  );

  runApp(MyApp(
    store: store
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  
  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store, 
      child: new MaterialApp(
        theme: ThemeData(
          fontFamily: 'Sans',
          accentColor: Colors.black54,
          backgroundColor: Colors.white,
          primaryColor: Colors.greenAccent
        ),
        routes: routes(this.store.state.primeiroAcesso),
      )
    );
  }
}