import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Playing with Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  image: DecorationImage(
                      image: AssetImage("assets/download.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text('Drawer Header',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          )),
                    )
                  ],
                )),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Burgers'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Pizz'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Cold Drinks'),
            ),
          ],
        ),
      ),
      body: Container(
        child: CarouselSlider(
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.shutterstock.com/image-vector/japanese-cuisine-traditional-food-dishes-600w-1724187613.jpg'),
                            fit: BoxFit.cover)),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 250.0,
            aspectRatio: 16 / 9,
            autoPlay: true,
            // enlargeCenterPage: true,
          ),
        ),
      ),
    );
  }
}
