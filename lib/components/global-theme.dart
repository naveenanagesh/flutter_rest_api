import 'package:flutter/material.dart';

class _GlobalTheme extends StatefulWidget {
  const _GlobalTheme();

  @override
  GlobalTheme createState() => GlobalTheme();
}

class GlobalTheme extends State<_GlobalTheme> {
  int buttonPressCount = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double pointCount = 8 + (buttonPressCount % 6);

    return Scaffold(
      appBar: AppBar(
        title: Text('Global Theme Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Text with Global Theme',
              style: Theme.of(context).textTheme.headline1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button with Global Theme'),
            ),
          ],
        ),
      ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Text(
    //       'Text with Global Theme',
    //       style: Theme.of(context).textTheme.headline1,
    //     ),
    //     ElevatedButton(
    //       onPressed: () {},
    //       child: Text('Button with Global Theme'),
    //     ),
    //   ],
    // );
    // return Scaffold(
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       setState(() {
    //         buttonPressCount += 1;
    //       });
    //     },
    //     tooltip: "Change the shape's point count",
    //     child: const Icon(Icons.add),
    //   ),
    //   body: AnimatedContainer(
    //     duration: const Duration(milliseconds: 500),
    //     margin: const EdgeInsets.all(32),
    //     alignment: Alignment.center,
    //     decoration: ShapeDecoration(
    //       color: colorScheme.tertiaryContainer,
    //       shape: StarBorder(
    //         points: pointCount,
    //         pointRounding: 0.4,
    //         valleyRounding: 0.6,
    //         side: BorderSide(width: 9, color: colorScheme.tertiary),
    //       ),
    //     ),
    //     child: Text(
    //       '${pointCount.toInt()} Points',
    //       style: theme.textTheme.headlineMedium!.copyWith(
    //         color: colorScheme.onPrimaryContainer,
    //       ),
    //     ),
    //   ),
    // );
  }
}
