import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counterClic = 0;
  void increaseCounter() {
    counterClic++;
    setState(() {});
  }

  void decreaseCounter() {
    counterClic--;
    setState(() {});
  }

  void restartCounter() {
    counterClic = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ASTRONET',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 40,
                //backgroundColor: Colors.white,
                decoration: TextDecoration.overline,
                color: Colors.redAccent)),
        elevation: 25.0,
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Numero de cLICS ',
              style: fontSize30,
            ),
            Text('$counterClic', style: fontSize30),
          ],
        ),
      ),
      //floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increaseCounter,
        decreaseFn: decreaseCounter,
        restartFn: restartCounter,
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     FloatingActionButton(
      //       child: const Icon(Icons.model_training_rounded),
      //       onPressed: () => (setState(() => counterClic = 0)),
      //     ),
      //     const SizedBox(width: 20),
      //     FloatingActionButton(
      //       child: const Icon(Icons.minor_crash_rounded),
      //       onPressed: () => (setState(() => counterClic++)),
      //     ),
      //     const SizedBox(width: 20),
      //     FloatingActionButton(
      //       child: const Icon(Icons.minor_crash_outlined),
      //       onPressed: () => (setState(() => counterClic--)),
      //     ),
      //   ],
      // ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function restartFn;

  const CustomFloatingActions({
    super.key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.restartFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.minor_crash_rounded),
          onPressed: () => increaseFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.minor_crash_outlined),
          onPressed: () => decreaseFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.model_training_rounded),
          onPressed: () => restartFn(),
        ),
      ],
    );
  }
}
