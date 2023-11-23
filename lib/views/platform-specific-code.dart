import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformPage extends StatelessWidget {
  const PlatformPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Container(alignment: Alignment.topLeft, child: buildButton()),
    ));
  }
}

Text checkPlatform() {
  if (Platform.isIOS) {
    return const Text('Running on iOS');
  } else if (Platform.isAndroid) {
    const Text('Running on Android');
  } else if (Platform.isMacOS) {
    const Text('Running on macOS');
  } else if (Platform.isWindows) {
    const Text('Running on Windows');
  } else if (Platform.isLinux) {
    const Text('Running on Linux');
  } else {
    return const Text('Running on a different platform');
  }
  return const Text('testingggg');
}

Widget buildButton() {
  if (Platform.isIOS) {
    return CupertinoButton(
      child: Text('IOSButton'),
      onPressed: () {
        const Text('IOS Button pressed');
      },
    );
  } else {
    return ElevatedButton(
      child: Text('Other Button'),
      onPressed: () {
        // Action for Android button
      },
    );
  }
}
