# openCX-admins Development Report

Welcome to the documentation pages of Guideasy of **openCX**!

You can find here detailed information about the (sub)product, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP): 

* Business modeling 
  * [Product Vision](#Product-Vision-)
  * [Elevator Pitch](#Elevator-Pitch-)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical Architecture](#Logical-architecture)
  * [Physical Architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* Test
  * [Automated tests](#Automated-Tests): Functional tests, integration tests, acceptance tests, as much automated as possible.
* [Change management](#Change-Management)
* Project management
  * [Tasks management tool](#Tasks-Management-Tool)
* [Planned Features](#Planned-Features)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!

:poodle: [Márcia Teixeira](https://github.com/marciat "marciat")

:squirrel: [Mário Gil](https://github.com/GambuzX "GambuzX")

:dromedary_camel: [Miguel Pinto](https://github.com/MiguelDelPinto "MiguelDelPinto")

:dragon_face: [Pedro Esteves](https://github.com/pemesteves "pemesteves")

## Product Vision :zap:

Swift navigation between key spots in a conference through a mobile app.




## Elevator Pitch :speech_balloon:


Guideasy is an easy-to-use app, that allows you to quickly find anything you might ever need in an event. It's got an interactive map of the venue with your real-time position on it, all of the time, using GPS technology. It also shows the position of every point of interest you may need, allowing you to easily filter through them, so that only what you want is displayed, whether it's the snack bar, vending machines, restrooms, elevators, etc. You can also look for a room using a search bar with autocomplete functionalities. Finally, there's a set of key spots, in the main screen, that you can select. It'll then calculate the closest one to you, of the type you have selected, and display it on the map.


## Requirements :clipboard:

### Use case diagram 

![Use cases diagram](https://github.com/softeng-feup/open-cx-admins/raw/master/docs/use_cases/guideasy_use_cases.png "Guideasy Use Cases")

#### Get directions for POI

* **Actor**

A conference attendant.

* **Description**

Presents direction to a specified POI, allowing easy navigation to anywhere that the user desires.

* **Preconditions**

The user must select a desired POI and he must be in range to one of the bluetooth beacons, so that his position can be accurately determined.

* **Postconditions**

The app will highlight a path to the POI in the map.

* **Normal Flow**

1. The user selects a POI on the app's interactive map.
2. The user's position will be calculated using the position of close bluetooth beacon(s).
3. A path will be calculated from the user's position to the selected POI's position.
4. The resulting path will be display on the app's interactive map, by highlighting the roads or corridors to it.

* **Alternative Flows and Exceptions**

1. The user selects a type of POI on the app's interactive map. It can be, for example, a conference or a bathroom.
2. A bluetooth beacon, connected to the user's cellphone at the moment, will extract information from the user's position.
3. A path will be calculated from the user's position to the nearest POI of the same type.
4. The resulting path will be display on the app's interactive map, by highlighting the roads or corridors to it.

---

#### Visualize event map with POIs

* **Actor**

A conference attendant.

* **Description**

Presents a map with selected POI's, allowing the user to filter the type of POIs he wants to see.

* **Preconditions**

The user can select the desired POI from the map, using some filters to select it.

* **Postconditions**

The app will show the information about the selected POI. 

* **Normal Flow**

1. The user selects the visualize map option.
2. The interactive map window will open and the map will be display.

* **Alternative Flows and Exceptions**
    
    - **Filter POIs** 
    1. The user selects one or more filters from the filter list. 
    2. The filtered POI's appear on the app's interactive map. 
    
    <br>
    
    - **Get Info About POI**
    1. The user selects one of the POI's on the app's interactive map.
    2. The information about the selected POI will be display on the app's interactive map, near that point.
---

#### Show closest POI of type

* **Actor**

A conference attendant.

* **Description**

Show POI of specified type that is closest to user.

* **Preconditions**

The user must select a type of POI in the main page.

* **Postconditions**

There will be a marker on the map on the position of the POI of the specified type that is closest to user.

* **Normal Flow**

1. The user selects POI type on the app's home page.
2. The distance from user to the POIs of that type is calculated and the closest one is selected.
3. The closest POI is shown as a marker on the map page.

* **Alternative Flows and Exceptions**

1. The user searches for a room in the home page search bar
2. The user selects a room in the search bar suggestions
3. A marker on the room's position is showed on the map
---


### User stories

The user stories are organized in the following user story map:

![User stories diagram](https://github.com/softeng-feup/open-cx-admins/raw/master/docs/user_stories/user_stories.jpg)

The Epic represented in the map is broken down into the following user stories:


##### Hungry Hippo
As a very hungry person, I want to quickly find any cafeterias or vending machines so that I don't starve.


##### Rain Man
As a person with bladder issues, I want to find a bathroom as soon as I can, so that I don't embarrass myself.


###### Where to find them
Other user stories can be found in the group's [trello page](https://trello.com/b/9YiPpP4W/esof?menu=filter&filter=label:User%20Stories), under the **User Stories** card.

---

### Domain model

![Domain model](https://github.com/softeng-feup/open-cx-admins/raw/master/docs/domain_model/domain_model.png)

---

## Architecture and Design


### Logical architecture


![Logical architecture model](https://github.com/softeng-feup/open-cx-admins/raw/master/docs/architecture/logical_architecture.png)

The code is organized in a Model-View-Controller fashion, using Redux to manage the application State.

The `model/` folder holds data structures and domain object representations, such as PointOfInterest, AppState, POIType.

The `view/` folder contains all the pages and widgets that are displayed to the user and with which he interacts.

The `controller/` is responsible for handling the user requests and interactions, which are received through the view.

Redux is used to centralize the application State, allowing different parts of the app to know the state of each other and easily connect them. This was used in order to prevent the need of passing down information from parent widgets to its grand grand children, making the code more readable and manageable.



### Physical architecture

![Physical architecture model](https://github.com/softeng-feup/open-cx-admins/raw/master/docs/physical_architecture/physical_architecture.jpg)


With the intent of creating an application for navigation inside a conference, creating a mobile app seemed like the best choice, since everyone has a phone. By this means, each user could simply download the app and use it, without any additional hardware requirements.

We considered and debated about two frameworks for mobile, Flutter and ReactNative. We opted with the former for its integration with Google Maps and its easier learning curve, in addition to some members already having some experience in it.

In order to obtain information about our current position and be able no travel in the venue, our first approach was to interact with bluetooth beacons and calculate it through triangulation. We considered using Micro:bit, for its versatility and low costs. If implemented with success, this had the benefit of a more accurate position and tracking system, ideal in the inside of buildings (against GPS).

However, this approach also had its downsides and challenges:
- Necessity of placing many beacons around the event, increasing hardware costs;
- No previous experience of our group on bluetooth technologies or low level hardware programming;
- Requirement of implementing our own custom map of the venue in Flutter, highly increasing our workload;

Having considered all the options, we opted for using the Google Maps API, which had a package in Flutter. It provides a Widget to display a map with a good enough set of customization options, easily allowing the user to navigate, pan, zoom and rotate around. We found that the advantages outweighed its problems and went forward with it. Even though the GPS tracking is not perfect inside buildings, it is good enough for a user to understand where he is and where he needs to go.

Ideally, the information about the points of interest to display on the map should be provided through a server to all users, allowing it to be changed and updated anytime. While that option is still in development, we stored the data locally in a JSON file which we read at the start of the app. After read, the data is stored in a database and is persistently available to the user. We opted for an implementation of SQLite in Flutter for our database system.

The result is a Mobile App, created in **Flutter**, which interacts through the internet with the **Google Maps API** to display the maps. It retrieves information about the Points of Interest at the beggining and stores it in a **SQLite database**. Finally, it makes use of **GPS** technology to get information about the user's location and guide him through the event.


### Prototype

As a first step, there was some discussion regarding what programming languages and technologies were going to be used in the app. It was then decided that Flutter would be the best choice.

After that, the main focus of the first iteration became defining and implementing the user's interface, in a way that was easy to understand, while also being appealing and good-looking. This resulted in the creation of a splash screen and a main page.

![Main Page Prototype](https://github.com/softeng-feup/open-cx-admins/blob/master/docs/ui_mockups/images/take_me_to.png)

Finally, the last goal was to decide how to track the user's location, which then led to the inclusion of GPS technology in the project's plans.

---

## Implementation

The app routes are separated from the `main.dart` and defined in [Router.dart](https://github.com/softeng-feup/open-cx-admins/blob/master/guideasy_app/lib/controller/routes/Router.dart).

Since we followed the Redux architecture, the state of the app is managed in an untypical manner. Instead of each stateful widget storing its state and passing it down through its children, this may be decoupled and stored in the [AppState](https://github.com/softeng-feup/open-cx-admins/blob/master/guideasy_app/lib/model/AppState.dart).

The Points of Interest are loaded and stored on the database on the start of the app by calling the appropriate Action. This, as other state changing methods, are defined in the [ActionCreators](https://github.com/softeng-feup/open-cx-admins/blob/master/guideasy_app/lib/redux/ActionCreators.dart/lib/redux/ActionCreators.dart).

To access the AppState, you must get a reference to a StoreProvider through the BuildContext. This can be done in many ways, such as wrapping the build method of a widget in a `StoreConnector` or by calling `StoreProvider.of<AppState>(context)`.

---
## Tests

### Automated Tests

#### Acceptance Tests
We have defined some acceptance tests using Gherkin, which can be found in our [Trello board](https://trello.com/b/9YiPpP4W/esof) under 'Acceptance Tests - Gherkin'.

Some acceptance tests have been  [automated](https://github.com/softeng-feup/open-cx-admins/tree/master/guideasy_app/test_driver) using Flutter Gherkin. These features are:
* [Map filters](https://github.com/softeng-feup/open-cx-admins/blob/master/guideasy_app/test_driver/features/map_filters.feature)
* [Opening map page](https://github.com/softeng-feup/open-cx-admins/blob/master/guideasy_app/test_driver/features/map_page.feature)
* [Splash screen transition](https://github.com/softeng-feup/open-cx-admins/blob/master/guideasy_app/test_driver/features/splash_screen.feature)

## Change Management

To manage changes in our repository, we followed GitHub flow. We marked our `master` branch as protected, making it necessary to use pull requests with at least one approving review before commiting to it.

As features were being added, managed through `Trello`, we would create branches that were later merged into master.

The end of each iteration is marked with a Tag.

## Project Management

### Tasks Management Tool

We use Trello to coordinate ourselves and to manage our tasks.

You can find the board for this project [here](https://trello.com/b/9YiPpP4W/esof).

## Planned Features

We have some features in plan, defined in our [Trello board](https://trello.com/b/9YiPpP4W/esof) in the card `Backlog`. These include:

- **Reading data from backend.** The required models and routes have already been defined in the open-cx server, the only change needed would be to read from there instead of from a local file, and to fill the open-cx server with our info.
- **Custom icons on the map.** Even though its troublesome, the maps widget supports changing the icons of the markers. The idea would be to have an icon for each type of POI to better help identifying them. 
- **Store event location as a graph.** The idea is to store additional points in the map, vertices and edges, to allow defining the paths between each point of interest and allow to draw paths in the map. This was marked as not prioritary since there would be additional complications, such as the user being away from any graph vertex and the application not being able to know how to draw the path correctly (locating the nearest POI is not a solution since the user can't traverse walls and floors).
- **Interact with bluetooth.** Since GPS sometimes fails or is not accurate, the idea would be to use bluetooth beacons to, through triangulation, better determine the user location at any time. This would allow to also locate the current floor of the user.
