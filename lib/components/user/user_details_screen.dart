// import 'package:flutter/material.dart';
// import 'package:flutter_rest_api/models/user/user.dart';

// import 'package:redux/redux.dart';

// import 'package:flutter_redux/flutter_redux.dart';

// import 'package:flutter_rest_api/models/app_state2.dart';
// import 'package:flutter_rest_api/models/user/user_state.dart';

// class UserDetailsScreen extends StatelessWidget {
//   const UserDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, UserDetailsScreenProps>(
//       converter: (store) => mapStateToProps(store),
//       builder: (context, props) {
//         UserDetails data = props.detailsResponse.data;
//         bool loading = props.detailsResponse.loading;

//         TextStyle textStyle = const TextStyle(
//           height: 2,
//           fontSize: 20,
//         );

//         Widget body;
//         if (loading) {
//           body = const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           body = Center(
//             child: IntrinsicWidth(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(data.name, style: textStyle),
//                   Text(data.email, style: textStyle),
//                   Text(data.website, style: textStyle),
//                 ],
//               ),
//             ),
//           );
//         }

//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('User details'),
//           ),
//           body: body,
//         );
//       },
//     );
//   }
// }

// class UserDetailsScreenProps {
//   final UserDetailsState detailsResponse;

//   UserDetailsScreenProps({
//     this.detailsResponse,
//   });
// }

// UserDetailsScreenProps mapStateToProps(Store<AppState> store) {
//   return UserDetailsScreenProps(
//     detailsResponse: store.state.user.details,
//   );
// }
