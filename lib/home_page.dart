import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double num1 = 0, num2 = 0, sum = 0;
  TextEditingController cntrlr1 = TextEditingController();
  TextEditingController cntrlr2 = TextEditingController();

  void doAddition() {
    num1 = double.parse(cntrlr1.text);
    num2 = double.parse(cntrlr2.text);
    sum = num1 + num2;
    setState(() {});
  }

  void doSubraction() {
    num1 = double.parse(cntrlr1.text);
    num2 = double.parse(cntrlr2.text);
    sum = num1 - num2;
    setState(() {});
  }

  void doImpact() {
    num1 = double.parse(cntrlr1.text);
    num2 = double.parse(cntrlr2.text);
    sum = num1 * num2;
    setState(() {});
  }

  void doDivide() {
    num1 = double.parse(cntrlr1.text);
    num2 = double.parse(cntrlr2.text);
    sum = num1 / num2;
    setState(() {});
  }

  void clearOutputAndForm() {
    num1 = 0;
    num2 = 0;
    sum = 0;
    cntrlr1.text = "0";
    cntrlr2.text = "0";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator APP"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Output
              myOutput,
              //Input 1
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: myFormInput(cntrlr1, hintText: "Enter Number 1")),
              //Input 2
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: myFormInput(cntrlr2, hintText: "Enter Number 2")),
              const SizedBox(
                height: 30,
              ),
              //Buton row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  operationButton(doAddition, "+"),
                  const SizedBox(
                    width: 50,
                  ),
                  operationButton(doSubraction, "-"),
                ],
              ),
              //Buton row 2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  operationButton(doImpact, "*"),
                  const SizedBox(
                    width: 50,
                  ),
                  operationButton(doDivide, "/"),
                ],
              ),
              //Clear button
              ElevatedButton(
                onPressed: clearOutputAndForm,
                child: const Text("Clear"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget operationButton(VoidCallback transaction, String op) {
    return ElevatedButton(onPressed: transaction, child: Text(op));
  }

  Widget get myOutput {
    return Text(
      "Output : ${sum.toStringAsFixed(1)}",
      style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.red),
    );
  }

  Widget myFormInput(TextEditingController t,
      {String hintText = "Enter number"}) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      controller: t,
      keyboardType: TextInputType.number,
    );
  }
}
