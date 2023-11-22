// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// class CameraScreen extends StatefulWidget {
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController? _controller;
//   late Future<void>? _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();

//     availableCameras().then((cameras) {
//       if (cameras.isNotEmpty) {
//         _controller = CameraController(cameras[0], ResolutionPreset.medium);
//         _initializeControllerFuture = _controller!.initialize();
//         setState(() {});
//       }
//     }).catchError((e) {
//       print('Error while initializing camera: $e');
//     });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   void takePicture() async {
//     try {
//       await _initializeControllerFuture;

//       final image = await _controller!.takePicture();

//       print('Picture taken at ${image.path}');
//     } catch (e) {
//       print('Error taking picture: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_controller == null || _controller!.value.isInitialized) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Camera Example'),
//       ),
//       body: AspectRatio(
//         aspectRatio: _controller!.value.aspectRatio,
//         child: CameraPreview(_controller!),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.camera),
//         onPressed: takePicture,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
