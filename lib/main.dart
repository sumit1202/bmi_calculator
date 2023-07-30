import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var heightFtController = TextEditingController();
  var heightInController = TextEditingController();
  var weightKgController = TextEditingController();
  var result = "Result will be shown here...";
  var bgColor = Colors.black12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: bgColor,
          child: Center(
            child: SizedBox(
              width: 300,
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Check Your BMI'),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: heightFtController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Your height in feet:')),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: heightInController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Your height in inch:')),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: weightKgController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Your weight in kg:')),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var ht_ft = heightFtController.text.toString();
                        var ht_in = heightInController.text.toString();
                        var wt_kg = weightKgController.text.toString();

                        if (ht_ft != "" && ht_in != "" && wt_kg != "") {

                          var int_ht_ft = int.parse(ht_ft);
                          var int_ht_in = int.parse(ht_in);
                          var int_wt_kg = int.parse(wt_kg);

                          var ht_in_meter = ((((int_ht_ft*12)+int_ht_in)*2.54)/100);

                          var bmi = (int_wt_kg/(ht_in_meter*ht_in_meter));

                          if(bmi<18){
                            bgColor = Colors.yellow.shade100;
                            result = "BMI: ${bmi.toStringAsFixed(2)}, you are UNDERWEIGHT...";

                          }else if(bmi>25){
                            bgColor = Colors.red.shade100;
                            result = "BMI: ${bmi.toStringAsFixed(2)}, you are OVERWEIGHT...";

                          }else{
                            bgColor = Colors.green.shade100;
                            result = "BMI: ${bmi.toStringAsFixed(2)}, you are HEALTHY...";
                          }

                          setState(() {});

                        } else {
                          result =
                              "Please fill all the fields mentioned above...";
                          setState(() {});
                        }
                      },
                      child: const Text('Calculate', style: TextStyle(
                        color: Colors.black,
                      ),),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(result)
                ],
              ),
            ),
          ),
        ));
  }
}
