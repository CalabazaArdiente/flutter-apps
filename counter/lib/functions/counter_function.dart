import 'package:flutter/material.dart';

class CounterFunction extends StatefulWidget {
  const CounterFunction({Key? key}) : super(key: key);

  @override
  State<CounterFunction> createState() => _CounterFunctionState();
}

class _CounterFunctionState extends State<CounterFunction> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hola!'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$counter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                counter == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.replay_outlined,
              onPress: () {
                counter = 0;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                icon: Icons.plus_one,
                onPress: () {
                  counter += 1;
                  setState(() {});
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                icon: Icons.exposure_minus_1_outlined,
                onPress: () {
                  if (counter > 0) counter -= 1;
                  setState(() {});
                })
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.onPress,
  });

  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      shape: const StadiumBorder(),
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
