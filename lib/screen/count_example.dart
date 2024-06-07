import 'package:flutter/material.dart';
import 'package:flutter_vs_provider_count_example/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {

    final countProvider = Provider.of<CountProvider> (context, listen: false);
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Count Example"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          print("Only This Widget");
          return Text(countProvider.count.toString(),
        style: TextStyle(
          fontSize: 30,
        ),
        );

        },)
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),),
    );
  }
}