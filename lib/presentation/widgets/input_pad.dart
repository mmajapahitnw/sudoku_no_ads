import 'package:flutter/material.dart';

class InputPad extends StatelessWidget {
  const InputPad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.backspace),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.undo),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.redo),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.edit),
            ),
          ],
        ),
        Wrap(
          alignment: .center,
          children: [
            ...List.generate(9, (index) {
              final number = index + 1;
              return Padding(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Text(number.toString(), style: TextStyle(fontSize: 20)),
                      Text('9', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
