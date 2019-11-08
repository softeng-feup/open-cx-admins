class AppState {
  Map content = Map<String, dynamic>();

  Map getInitialContent() {
    return {
      "pointsOfInterest" : [],
      "poisStatus" : RequestStatus.NONE
    };
  }

  AppState(Map content) {
    if (content != null) {
      this.content = content;
    } else {
      this.content = this.getInitialContent();
    }
  }

  AppState cloneAndUpdateValue(key, value) {
    return new AppState(Map.from(this.content)..[key] = value);
  }

  AppState getInitialState() {
    return new AppState(null);
  }
}

enum RequestStatus {
  NONE, BUSY, FAILED, SUCCESSFUL
}