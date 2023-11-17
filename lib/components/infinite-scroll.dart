import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_rest_api/services/remote_service.dart';

class InfiniteScrollDemo extends StatefulWidget {
  const InfiniteScrollDemo({super.key});

  @override
  _InfiniteScrollDemoState createState() => _InfiniteScrollDemoState();
}

class _InfiniteScrollDemoState extends State<InfiniteScrollDemo> {
  List<dynamic> _data = [];
  bool _loading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Initially, load the first set of data
    _loadData();
    // Add a listener to the scroll controller
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Method to fetch data from the API
  // Future<void> _fetchData() async {
  //   final response = await http.get(Uri.parse(
  //       'https://api.example.com/data')); // Replace with your API endpoint
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     setState(() {
  //       _data.addAll(jsonData); // Add fetched data to the list
  //       _loading = false;
  //     });
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // Method to load more data
  Future<void> _loadData() async {
    setState(() {
      _loading = true;
    });
    final _jsonData = await RemoteService().fetchData();
    final jsonData = json.decode(_jsonData);
    print('datataaaa');
    print(jsonData);

    setState(() {
      _data.addAll(jsonData); // Add fetched data to the list
      _loading = false;
    });
  }

  // Scroll listener method
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has scrolled to the bottom, load more data
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scroll Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _data.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < _data.length) {
                  // Display fetched data in list items
                  return ListTile(
                    title: Text(
                        'Album Id:${_data[index]['albumId']} ---${_data[index]['title']}'), // Adjust data display as per your API response
                  );
                } else {
                  return _loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(); // If not loading, show an empty SizedBox
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
