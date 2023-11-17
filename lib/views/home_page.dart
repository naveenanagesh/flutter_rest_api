import 'package:flutter_rest_api/components/infinite-scroll.dart';
import 'package:flutter_rest_api/models/locations.dart';
import 'package:flutter_rest_api/services/login.dart';
import 'package:flutter_rest_api/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/models/therapists.dart';
// import 'package:flutter_rest_api/views/camera_page.dart';
import 'package:flutter_rest_api/views/images_page.dart';
import 'package:flutter_rest_api/views/login_page.dart';
import 'package:flutter_rest_api/views/platform-specific-code.dart';
import 'package:flutter_rest_api/views/tabs_page.dart';
// import 'package:flutter_rest_api/views/video_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;
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
    // if (locations != null) {
    //   setState(() {
    //     isLoaded = true;
    //   });
    // }
    // print(isLoaded);
  }

  getTherapistsList() async {
    therapists = await RemoteService().getTherapists();
    print(therapists);

    if (therapists != null) {
      setState(() {
        isLoaded = true;
      });
    }
    print(isLoaded);
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
        page = LocationsPage(locations, isLoaded);
        break;
      case 1:
        page = ServicePage(therapists, isLoaded);
        break;
      case 2:
        page = const ImagesPage();
        break;
      case 3:
        page = const PlatformPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          elevation: 4.0,
          // centerTitle: false,
          backgroundColor: Colors.lightBlueAccent,

          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add onPressed action here
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                _showPopupMenu(context);
              },
            ),
          ],
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
                  // NavigationRailDestination(
                  //   icon: Icon(Icons.video_call),
                  //   label: Text('Video'),
                  // ),
                  NavigationRailDestination(
                      icon: Icon(Icons.app_blocking_rounded),
                      label: Text("Platform Specifications")),
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

class LocationsPage extends StatelessWidget {
  LocationsPage(this.locations, this.isLoaded, {super.key});
  var isLoaded = false;
  LocationsList? locations;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: locations?.length,
        itemBuilder: (context, index) {
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
                        locations?.items[index].name ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        locations?.items[index].address ?? '',
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

void _showPopupMenu(BuildContext context) {
  final RenderBox appBarRenderBox = context.findRenderObject() as RenderBox;
  final RenderBox overlay =
      Overlay.of(context)!.context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      appBarRenderBox.localToGlobal(appBarRenderBox.size.topRight(Offset.zero),
          ancestor: overlay),
      appBarRenderBox.localToGlobal(
          appBarRenderBox.size.bottomRight(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  showMenu<String>(
    context: context,
    position: position,
    items: [
      const PopupMenuItem<String>(
        value: 'item1',
        child: Text('Item 1'),
      ),
      const PopupMenuItem<String>(
        value: 'tabs',
        child: Text('Tabs'),
      ),
      const PopupMenuItem<String>(
        value: 'infinteScroll',
        child: Text('Infinte Scroll Example'),
      ),
    ],
    elevation: 12.0,
  ).then((selectedValue) {
    if (selectedValue != null) {
      switch (selectedValue) {
        case "tabs":
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TabBarPage()));
          break;
        case "infinteScroll":
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const InfiniteScrollDemo()));
          break;
        default:
          throw UnimplementedError('no widget for $selectedValue');
      }
      // Perform action based on the selected item
      print('Selected: $selectedValue');
    }
  });
}
