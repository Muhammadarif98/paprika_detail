import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Paprika'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 16, bottom: 8, right: 16),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Image.asset('assets/discount.png'),
                  ),
                  Text(
                    'Ваша скидка в следующем месяце'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Padding(
                padding:
                EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
                child: Text(
                    'Регулярно совершайте покупки для получения в следующем месяце более высокого статуса и больших привелегий',
                    style: TextStyle(fontSize: 12, color: Colors.grey))),
            const SkaleWidget(numShop: 15),
            StatusWidget(numShop: 15),
            Padding(
              padding:
              const EdgeInsets.only(left: 8, top: 8, bottom: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Text("до 15 покупок",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("до 25 покупок",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text("более 25 покупок",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 0, top: 16, bottom: 0, right: 0),
                child: Text('Подробнее о статусах',
                    style: TextStyle(fontSize: 18, color: Colors.blueAccent))),
          ],
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  StatusWidget({
    Key? key, required this.numShop,
  }) : super(key: key);
  final int numShop;
  static List<String> list = ['Серебро', 'Золото', 'Платина'];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        const EdgeInsets.only(left: 16, top: 8, bottom: 0, right: 16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StatusSilverWidget(isNamed: list[0], purchaseCount: numShop,),
              Container(
                alignment: Alignment.topCenter,
                color: (numShop > 15) ? Colors.green : Colors.grey,
                height: 1,
                width: 25,
              ),
              StatusGoldWidget(isNamed: list[1], purchaseCount: numShop),
              Container(
                alignment: Alignment.topCenter,
                color: (numShop > 25) ? Colors.green : Colors.grey,
                height: 1,
                width: 25,
              ),
              StatusPlatinaWidget(isNamed: list[2], purchaseCount: numShop),
            ]
        )
    );
  }
}

class StatusPlatinaWidget extends StatelessWidget {
  StatusPlatinaWidget({
    Key? key, required this.isNamed, required this.purchaseCount,
  }) : super(key: key);
  String isNamed;
  final int purchaseCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: (purchaseCount > 25) ? Colors.green : Colors.grey)),
        child: Row(
            mainAxisAlignment: (purchaseCount > 25) ? MainAxisAlignment
                .spaceEvenly : MainAxisAlignment.center,
            children: <Widget>[
              Visibility(visible: (purchaseCount > 25) ? true : false,
                child: Image.asset('assets/tick.png'),),
              Center(
                child: Text(isNamed.toUpperCase(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: (purchaseCount > 25) ? Colors.green : Colors
                            .grey)),
              )
            ]),
        height: 32,
      ),
    );
  }
}

class StatusGoldWidget extends StatelessWidget {
  StatusGoldWidget({
    Key? key, required this.isNamed, required this.purchaseCount,})
      : super(key: key,);
  String isNamed;
  final int purchaseCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 0, right: 0),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: (purchaseCount > 15) ? Colors.green : Colors.grey)),
        child: Row(
            mainAxisAlignment: (purchaseCount > 15) ? MainAxisAlignment
                .spaceEvenly : MainAxisAlignment.center,
            children: <Widget>[
              Visibility(visible: (purchaseCount > 15) ? true : false,
                child: Image.asset('assets/tick.png'),),
              Center(
                  child: Text(isNamed.toUpperCase(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: (purchaseCount > 15) ? Colors.green : Colors
                            .grey),
                  ))
            ]),
        height: 32,
      ),
    );
  }
}

class StatusSilverWidget extends StatelessWidget {
  StatusSilverWidget(
      {Key? key, required this.isNamed, required this.purchaseCount,})
      : super(key: key);
  String isNamed;
  final int purchaseCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.topCenter,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: (purchaseCount > 0) ? Colors.green : Colors.grey)),
          child: Row(
              mainAxisAlignment: (purchaseCount > 0) ? MainAxisAlignment
                  .spaceEvenly : MainAxisAlignment.center,
              children: <Widget>[
                Visibility(visible: (purchaseCount > 0) ? true : false,
                  child: Image.asset('assets/tick.png'),),
                Center(
                    child: Text(isNamed.toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: (purchaseCount > 0) ? Colors.green : Colors
                              .grey),
                    ))
              ])),
    );
  }
}

class SkaleWidget extends StatelessWidget {
  const SkaleWidget({Key? key, required this.numShop,}) : super(key: key);
  final int numShop;

  @override
  Widget build(BuildContext context) {
    double length(double fullLength) {
      return fullLength / 32 * numShop;
    }
    final size = MediaQuery
        .of(context)
        .size;

    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 0, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text("Покупок за сентябрь",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('$numShop',
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(
              left: 0, top: 0, bottom: 0, right: 0),
          child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, bottom: 6, right: 16),
                  child: Container(
                    // margin: const EdgeInsets.only(left: 16,right: 0),
                    alignment: Alignment.topCenter,
                    height: 12,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, bottom: 0, right: 16),
                  child: Container(
                    // margin: const EdgeInsets.only(left: 16,right: 0),
                    alignment: Alignment.topCenter,
                    height: 12,
                    width: length(size.width),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green)),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 9, bottom: 0, right: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          BoxWidget(),
                          PoloskiWidget(),
                          PoloskiWidget(),
                          PoloskiWidget(),
                          PoloskiWidget(),
                          PoloskiWidget(),
                          BoxWidget(),
                        ]))
              ])),
      Padding(
          padding: const EdgeInsets.only(
              left: 20, top: 0, bottom: 0, right: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text("0",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text("5",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text("10",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text("15",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text("20",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text("25",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text("30",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ])),
    ]);
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 2,
    );
  }
}

class PoloskiWidget extends StatelessWidget {
  const PoloskiWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      height: 20,
      width: 2,
    );
  }
}
