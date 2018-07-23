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

// TODO項目
class Entry {
  // ラベル文言
  String label;
  // チェック状態
  bool isChecked;

  Entry({this.label, this.isChecked = false});
}

// MyHomePageクラスの相方: _MyHomePageStateクラス
// StatefulWidgetの場合は、このStateに主な処理を書いていく
class _MyHomePageState extends State<MyHomePage> {
  // TODOリスト
  List<Entry> entries = [
    new Entry(label: 'あへあへ', isChecked: true),
    new Entry(label: 'どんどん'),
  ];

  // 画面に描画するWidgetを返す
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo Home Page'),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              Checkbox(
                value: entries[index].isChecked,
                onChanged: (bool checked) {
                  print(checked);
                  setState(() {
                    entries[index].isChecked = checked;
                  });
                },
              ),
              Text(entries[index].label),
            ],
          );
        },
      ),
    );
  }
}
