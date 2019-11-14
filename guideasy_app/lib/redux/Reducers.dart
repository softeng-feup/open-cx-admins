import 'package:guideasy_app/model/AppState.dart';

import 'Actions.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is SavePOIsAction) {
    return setPointsOfInterest(state, action);
  }
  else if (action is SavePOIsStatusAction) {
    return setPOIsStatus(state, action);
  }
  else if (action is UpdateMapFilter) {
    return setMapFilter(state, action);
  }
  return state;
}

AppState setPointsOfInterest(AppState state, SavePOIsAction action) {
  print('setting points of interest');
  return state.cloneAndUpdateValue('pointsOfInterest', action.pointsOfInterest);
}
AppState setPOIsStatus(AppState state, SavePOIsStatusAction action) {
  print('setting POIs status: ' + action.status.toString());
  return state.cloneAndUpdateValue('poisStatus', action.status);
}

AppState setMapFilter(AppState state, UpdateMapFilter action) {
  print('setting ' + action.title + ' filter to ' + action.selected.toString());
  return state.cloneAndUpdateValue(action.title, action.selected);
}