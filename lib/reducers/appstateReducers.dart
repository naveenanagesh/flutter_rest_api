import 'package:flutter_rest_api/models/appstate.dart';
import 'package:flutter_rest_api/models/common.dart';

AppState reducer(AppState prev, dynamic action) {
  if (action is FetchTimeAction) {
    return AppState(action.location, action.time);
  } else {
    return prev;
  }
}
