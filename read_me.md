This is a flutter project assignment for ropstam solution
This project is made up of Flutter's MVVM (Model-View-ViewModel) pattern
Model: The Model represents the data of the application. It typically consists of classes that encapsulate the data and functionality required by the application.

View: The View represents the user interface of the application. It is responsible for displaying the data to the user and responding to user interactions.

ViewModel: The ViewModel acts as an intermediary between the View and the Model. It exposes the data and functionality of the Model to the View, and it handles user interactions and updates the Model accordingly.

When using the MVVM pattern with Flutter, you can use the Provider package to manage the state of your application. Provider is a package that makes it easy to share data between widgets, and it is commonly used with the MVVM pattern in Flutter.

In this app we create a simple splash screen in which we are checking if data in user session already exist it navigate to dashboard otherwise it navigate to login.
In Login page a view for better look and also attched validation and api.
In signup page I add validation and feilds.
In home page a local list of cars is shown which data we add through floating action button in a local list in provider state managment.
we can add data through click on floating action button where validation on empty feild is applied.
After add data we see on home page where we can go for edit on edit icon and also delete data on click of delete icon.

important!
These list are save in state so if we kill app state it does not show data.
