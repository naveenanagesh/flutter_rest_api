import 'package:flutter/material.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key}) : super(key: key);

  @override
  State<ImagesPage> createState() => _ImagesPage();
}

class _ImagesPage extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: const Row(
          children: [
            Image(
              image: AssetImage('assets/images/images1.jpeg'),
              width: 200.0,
              height: 200.0,
            ),
            Image(
              image: NetworkImage(
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
              width: 200.0,
              height: 200.0,
            )
            // ImagesWidget(url: 'images/images1.jpeg', network: 0),
            // ImagesWidget(url: 'images/images1.jpeg', network: 0),
            // ImagesWidget(
            //     url:
            //         'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
            //     network: 1)
          ],
        ));
  }
}

// class ImagesWidget extends StatelessWidget {
//   final String url;
//   final dynamic network;
//   const ImagesWidget({Key? key, required this.url, required this.network})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (network) {
//       return const Image(
//         // image: AssetImage('images/images1.jpeg'),

//         image: NetworkImage(url),
//         width: 200.0,
//         height: 200.0,
//       );
//     } else {
//       return const Image(
//         image: AssetImage(url),

//         // image: NetworkImage(
//         //     'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
//         width: 200.0,
//         height: 200.0,
//       );
//     }
//   }
// }
