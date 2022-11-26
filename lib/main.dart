import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 6',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _preference = SharedPreferences.getInstance();
  bool _isBool = false;

  void _Boolean() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      _isBool = !_isBool;
      if (_isBool == true) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ));
        print("BERHASIL LOGIN");
        print(_isBool);
      } else {
        print("LOGIN GAGAL");
        print(_isBool);
      }
    });
    prefs.setBool('isbool', _isBool);
  }

  _getBool() async {
    final SharedPreferences prefs = await _preference;
    setState(() {
      _isBool = prefs.getBool('isbool') ?? _isBool;
      if (_isBool == true) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ));
        print(_isBool);
        print("SUDAH LOGIN");
      } else {
        print(_isBool);
        print("BELUM LOGIN");
      }
    });
  }

  void initState() {
    super.initState();
    _getBool();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: _Boolean, child: Text('EDIT')),
        ]),
      )),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5.0,
                    color: Color.fromARGB(255, 238, 238, 238),
                    child: Container(
                      width: 300,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "UMI FIFA LATIFAH",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    elevation: 5.0,
                    color: Color.fromARGB(255, 238, 238, 238),
                    child: Container(
                      width: 300,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2010631170036",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              width: 300,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child:
                    ElevatedButton(onPressed: (() {}), child: Text("SIMPAN DATA")),
              )),
        ]),
      )),
    );
  }
}
