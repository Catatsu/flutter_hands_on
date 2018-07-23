import 'package:flutter/material.dart';

//-------------------------------------
// メイン関数: 全てはここから始まる！
void main() {
  // アプリの起点となるrunApp()関数の引数に、
  // Widgetを渡してあげると、それが画面の起点となって表示される
  runApp(new MyApp());
}

//-------------------------------------
// StatelessWidget: アプリのルート画面
// MyAppは実際には画面を持っておらず、その中身に描画させている
class MyApp extends StatelessWidget {
  // Widgetは必ずbuild()というメソッドをオーバーライドして、
  // 戻り値として、画面に表示したいWidgetを返す
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

//-------------------------------------
// StatefulWidget: 実際の画面
// 常に固定の画面部品を表示させたい時 = StatelessWidgetを使う
// 状態によって画面部品の表示を変化させたい時 = StatefulWidgetとStateを使う
class MyHomePage extends StatefulWidget {
  // StatelessWidgetと違って、build()メソッドは持っていない
  // そのかわりに、createState()メソッドをオーバーライドして、build()メソッドを持つStateインスタンスを返してあげる
  @override
  _MyHomePageState createState() {
    return new _MyHomePageState();
  }
}

// MyHomePageクラスの相方: _MyHomePageStateクラス
// StatefulWidgetの場合は、このStateに主な処理を書いていく
class _MyHomePageState extends State<MyHomePage> {
  // 現在のカウンター値を保持する変数
  int _counter = 0;

  // ボタンが押されたときの処理
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 画面に描画するWidgetを返す
  @override
  Widget build(BuildContext context) {
    // Scaffold = タイトル部分(appBar)とその下の部分(body)、浮遊するボタン(FloatingActionButton)を持つWidget
    // Text = 文字列を描画するWidget
    // Center = childで渡されてきたWidgetの表示位置を調整するWidget
    // Column = childrenで渡されてきた複数のWidgetを、縦並びに表示するWidget
    // FloatingActionButton = 浮遊する丸いボタンを表示するWidget
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo Home Page'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center, // 中央寄せ
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              _counter.toString(),
              style: new TextStyle(fontSize: 34.0),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter, // ボタンを押された時に実行するメソッドを指定
        child: new Icon(Icons.add), // ボタンに表示する「+」マークを指定
      ),
    );
  }
}
