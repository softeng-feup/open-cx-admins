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
  * [Architectural and design decisions]()
  * [Technological architecture]()
  * [Logical architecture]()
* Implementation
  * [Source code]()
  * [Issues](): feature requests, bug fixes, improvements.
* Test
  * [Automated tests](#Automated-Tests): Functional tests, integration tests, acceptance tests, as much automated as possible.
* Change management
  * [Issues at Github]()
* Project management
  * [Tasks management tool](#Tasks-Management-Tool)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us! 

Thank you!

:poodle: [Márcia Teixeira](https://github.com/marciat "marciat")

:squirrel: [Mário Gil](https://github.com/GambuzX "GambuzX")

:dromedary_camel: [Miguel Pinto](https://github.com/MiguelDelPinto "MiguelDelPinto")

:dragon_face: [Pedro Esteves](https://github.com/pemesteves "pemesteves")

## Product Vision :zap:
```
Start by defining a clear and concise vision for your module, to help members of the team, contributors, and users into focusing their often disparate views into a concise, visual, and short textual form. It provides a "high concept" of the product for marketers, developers, and managers.

A product vision describes the essential of the product and sets the direction to where a product is headed, and what the product will deliver in the future.

To learn more about how to write a good product vision, please see also:
* [How To Create A Convincing Product Vision To Guide Your Team, by uxstudioteam.com](https://uxstudioteam.com/ux-blog/product-vision/)
* [Product Management: Product Vision, by ProductPlan](https://www.productplan.com/glossary/product-vision/)
* [Vision, by scrumbook.org](http://scrumbook.org/value-stream/vision.html)
* [How to write a vision, by dummies.com](https://www.dummies.com/business/marketing/branding/how-to-write-vision-and-mission-statements-for-your-brand/)
* [20 Inspiring Vision Statement Examples (2019 Updated), by lifehack.org](https://www.lifehack.org/articles/work/20-sample-vision-statement-for-the-new-startup.html)
```


Swift navigation between key spots in a conference through a mobile app.




## Elevator Pitch :speech_balloon:
```Draft a small text to help you quickly introduce and describe your product in a short time and a few words, a technique usually known as elevator pitch.

Take a look at the following links to learn some techniques:
* [Crafting an Elevator Pitch](https://www.mindtools.com/pages/article/elevator-pitch.htm)
* [The Best Elevator Pitch Examples, Templates, and Tactics - A Guide to Writing an Unforgettable Elevator Speech, by strategypeak.com](https://strategypeak.com/elevator-pitch-examples/)
* [Top 7 Killer Elevator Pitch Examples, by toggl.com](https://blog.toggl.com/elevator-pitch-examples/)
```

Attendees are often frustrated by the effort it takes to find the conference rooms, bathrooms, coffee break places, vending machines and snack-bars near a conference location. Guideasy eliminates the need to wander around and ask everyone where those places are. With our app, you can spend less wasted time searching where to go and focus on the conference itself. Here is our business card, do feel free to call us anytime. Thanks for your time!


## Requirements :clipboard:

```
In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

Start by contextualizing your module, describing the main concepts, terms, roles, scope and boundaries of the application domain addressed by the project.
```

### Use case diagram 

```
Create a use-case diagram in UML with all high-level use cases possibly addressed by your module.

Give each use case a concise, results-oriented name. Use cases should reflect the tasks the user needs to be able to accomplish using the system. Include an action verb and a noun. 

Briefly describe each use case mentioning the following:

* **Actor**. Name only the actor that will be initiating this use case, i.e. a person or other entity external to the software system being specified who interacts with the system and performs use cases to accomplish tasks. 
* **Description**. Provide a brief description of the reason for and outcome of this use case, or a high-level description of the sequence of actions and the outcome of executing the use case. 
* **Preconditions and Postconditions**. Include any activities that must take place, or any conditions that must be true, before the use case can be started (preconditions) and postconditions. Describe also the state of the system at the conclusion of the use case execution (postconditions). 

* **Normal Flow**. Provide a detailed description of the user actions and system responses that will take place during execution of the use case under normal, expected conditions. This dialog sequence will ultimately lead to accomplishing the goal stated in the use case name and description. This is best done as a numbered list of actions performed by the actor, alternating with responses provided by the system. 
* **Alternative Flows and Exceptions**. Document other, legitimate usage scenarios that can take place within this use case, stating any differences in the sequence of steps that take place. In addition, describe any anticipated error conditions that could occur during execution of the use case, and define how the system is to respond to those conditions. 
```

![Use cases diagram](https://github.com/softeng-feup/open-cx-admins/raw/master/docs/use_cases/guideasy_use_cases.png "Guideasy Use Cases")

#### Get directions for POI

* **Actor**

A conference attendant.

* **Description**

Presents direction to a specified POI, allowing easy navigation to anywhere that the user desires.

* **Preconditions**

The user must select a desired POI and he must in range to one of the bluetooth beacons, so that his position can be accurately determined.

* **Postconditions**

The app will highlight a path to the POI in the map.

* **Normal Flow**

1. The user selects a POI on the app's interactive map.
2. A bluetooth beacon, connected to the user's cellphone at the moment, will extract information from the user's position.
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



### User stories

```
This section will contain the requirements of the product described as **user stories**, organized in a global **user story map** with **user roles** or **themes**.

For each theme, or role, you may add a small description here. User stories should be detailed in the tool you decided to use for project management (e.g. trello or github projects).

A user story is a description of desired functionality told from the perspective of the user or customer. A starting template for the description of a user story is 

*As a < user role >, I want < goal > so that < reason >.*

You add more details after, but the shorter and complete, the better. In order to decide if the user story is good, please follow the INVEST guidelines.

After the user story text, you should add a draft of the corresponding user interfaces, a simple mockups or drafts, if applicable.

For each user story you should write also the acceptance tests (textually in Gherkin), ie, a description of situations that will help to confirm that the system satisfies the requirements addressed in the user story.

At the end, it is good to add a rough indication of the value of the user story to the customers (e.g. MoSCoW method) and the team should add an estimative of the effort to implement it, in t-shirt sizes (XS, S, M, L, XL).
```

The user stories are organized in the following user story map:

![User stories diagram](https://github.com/softeng-feup/open-cx-admins/raw/master/docs/user_stories/user_stories.jpg)

The Epic represented in the map is broken down into the following user stories:


##### Hungry Hippo
As a very hungry person, I want to quickly find any cafeterias or vending machines so that I don't starve.


##### Rain Man
As a person with bladder issues, I want to find a bathroom as soon as I can, so that I don't embarrass myself.


### Domain model
```
A simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module.
```
![Domain model](https://github.com/softeng-feup/open-cx-admins/raw/master/docs/domain_model/domain_model.png)

## Tests

### Automated Tests

#### Acceptance Tests
We have defined some acceptance tests using Gherkin, which can be found in our [Trello board](https://trello.com/b/9YiPpP4W/esof) under 'Acceptance Tests - Gherkin'.

For now they are only defined. The goal is for them to be automated in our application.

## Project Management

### Tasks Management Tool

We use Trello to coordinate ourselves and to manage our tasks.

You can find the board for this project [here](https://trello.com/b/9YiPpP4W/esof).
