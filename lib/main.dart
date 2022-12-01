import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  TextEditingController etInput = new TextEditingController();
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  convert() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      _reamur = 4 / 5 * _inputUser;
      _kelvin = _inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konverter Suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: etInput,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Suhu dalam Celcius',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Suhu dalam Kelvin',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '$_kelvin',
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Suhu dalam Reamur', style: TextStyle(fontSize: 16)),
                      Text(
                        '$_reamur',
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: convert, child: Text("Konversi Suhu")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
