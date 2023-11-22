import 'package:flutter_rest_api/models/locations.dart';
import 'package:flutter_rest_api/services/login.dart';
import 'package:flutter_rest_api/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/therapists.dart';
// import 'package:flutter_rest_api/views/camera_page.dart';
import 'package:flutter_rest_api/views/images_page.dart';
import 'package:flutter_rest_api/views/login_page.dart';
import 'package:flutter_rest_api/views/video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex;
  LocationsList? locations;
  TherapistsList? therapists;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getLocationsList();
    getTherapistsList();
  }

  getLocationsList() async {
    locations = await RemoteService().getLocations();
    setState(() {
      selectedIndex = 0;
    });
    // if (locations != null) {
    //   setState(() {
    //     isLoaded = true;
    //   });
    // }
    // print(isLoaded);
  }

  getTherapistsList() async {
    therapists = await RemoteService().getTherapists();
    if (therapists != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  signOut() async {
    await LogoutService.logout();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginPage(
                  title: 'login',
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LocationsPageState(locations: locations, isLoaded: isLoaded);
        break;
      case 1:
        page = ServicePage(therapists, isLoaded);
        break;
      case 2:
        page = const ImagesPage();
        break;
      // case 3:
      //   page = CameraScreen();
      //   break;
      default:
        page = const CircularProgressIndicator();
        break;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: ElevatedButton(
          // color: Colors.black,
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.amber),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.amber),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          child: const Text(
            'CLICK HERE TO LOGOUT',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        //  FloatingActionButton(
        //   onPressed: () {
        //     // signOut();
        //     print('Logout presssed');
        //     signOut();
        //     // Navigator.push(
        //     //     context,
        //     //     MaterialPageRoute(
        //     //         builder: (_) => const LoginPage(
        //     //               title: 'hhhh',
        //     //             )));
        //   },
        //   backgroundColor: Colors.green,
        //   child: const Icon(Icons.logout_rounded),
        // ),
        body: Row(
          // visible: isLoaded,
          // replacement: const Center(
          //   child: CircularProgressIndicator(),
          // ),
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Locations'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Therapists'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.face),
                    label: Text('Images'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.video_call),
                    label: Text('Video'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: page,
              ),
            ),
          ],
        ),
        // bottomSheet: Container(

        //   padding: const EdgeInsets.symmetric(vertical: 8.0),

        //   color: Colors.red,
        //   // alignment: Alignment.center,
        //   child: const Text("Footer"),
        // ),
        bottomNavigationBar: Container(
          color: Colors.red,
          // alignment: Alignment.bottomCenter,
          // padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: const Text('FOOTER'),
          //     Center(
          //   child:
          //   ElevatedButton(
          //     child: const Text(
          //       'Show Pop-up',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //     // color: Colors.black,
          //     onPressed: () {
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) => _buildPopupDialog(context),
          //       );
          //     },
          //   ),
          // ),
        ),
      );
    });
  }

  LoginPage logoutMettod() => const LoginPage(title: 'Login Page');

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Popup example'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Logout pup up model"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            signOut();
          },
          // color: Theme.of(context).primaryColor,
          child: const Text('Logout'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          // color: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class LocationsPageState extends StatefulWidget {
  const LocationsPageState(
      {super.key, required this.locations, required this.isLoaded});

  final LocationsList? locations;
  final bool isLoaded;
  @override
  State<LocationsPageState> createState() => _LocationState();
}

class _LocationState extends State<LocationsPageState> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print(widget.locations.toString());
  }

  @override
  void didUpdateWidget(LocationsPageState oldWidget) {
    super.didUpdateWidget(oldWidget);
    // print("didU[date]");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.locations?.items.isEmpty ?? false
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: widget.locations?.items.length,
              itemBuilder: (context, index) {
                return Location(widget.locations?.items[index]);
              },
            ),
    );
  }
}

//  FutureBuilder<LocationsPageState> buildFutureBuilder() {
//     return FutureBuilder<LocationsPageState>(
//       future: locations,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           print('naveeeeeanananananan');
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const HomePage(title: 'Home Page')),
//           );
//           // return const newWidget();
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }

//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }

class Location extends StatelessWidget {
  const Location(this.location, {super.key});
  final Locations? location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location?.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  location?.address ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServicePage extends StatelessWidget {
  ServicePage(this.therapists, this.isLoaded, {super.key});
  var isLoaded = false;
  TherapistsList? therapists;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: therapists?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          therapists?.items[index].first_name ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          therapists?.items[index].bio ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
