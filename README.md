# 📝 Todo App

A simple and clean Flutter To-Do application developed as part of the **Flutter Developer Intern Technical Assignment – BRT Multi Software LLP**.

The application allows users to create, view, update, complete/uncomplete, and delete tasks. Todo data is stored locally using **Hive**, while **GetX** is used for state management and navigation.

---

##  Features

*  Add new Todo
*  Display all Todos
*  Edit existing Todo
*  Mark Todo as completed/uncompleted
*  Delete Todo
*  Delete confirmation dialog
*  User feedback using GetX Snackbar
*  Empty state when there are no Todos
*  Local data persistence using Hive
*  Splash screen
*  SVG asset support
*  Clean and responsive Material UI

---

##  Tech Stack

* **Flutter**
* **Dart**
* **GetX** – State management and navigation
* **Hive / Hive Flutter** – Local data storage
* **Flutter SVG** – SVG asset rendering
* **Material Design** – UI components

---

##  Packages Used

| Package           |  Version | Purpose                                      |
| ----------------- | -------: | -------------------------------------------- |
| `get`             | `^4.7.3` | State management, reactive UI and navigation |
| `hive_flutter`    | `^1.1.0` | Local data persistence                       |
| `flutter_svg`     | `^2.3.0` | Display SVG images/assets                    |
| `cupertino_icons` | `^1.0.8` | iOS-style icons                              |

---

##  Project Structure


lib/
│
├── controllers/
│   └── todo_controller.dart
│
├── core/
│   └── constants/
│       └── app_images.dart
│
├── screens/
│   ├── splash_screen.dart
│   └── home_screen.dart
│
└── main.dart

assets/
└── images/
    └── ...
```

---

##  Application Flow

```text
App Launch
    │
    ▼
Splash Screen
    │
    │ 5 seconds
    ▼
Home Screen
    │
    ├── Add Todo
    │      └── Save to Hive
    │
    ├── View Todos
    │      └── Read from Hive
    │
    ├── Complete / Uncomplete
    │      └── Update Hive
    │
    ├── Edit Todo
    │      └── Update Hive
    │
    └── Delete Todo
           └── Delete from Hive
```

---

##  State Management

The application uses **GetX** for state management.

`TodoController` extends `GetxController` and maintains the Todo list using an observable list:

```dart
var todos = <Map<String, dynamic>>[].obs;
```

The UI uses `Obx()` to reactively rebuild whenever the Todo data changes.

This keeps the UI and business logic separated and makes the application easier to maintain.

---

##  Local Storage

**Hive** is used to store Todo data locally.

Each Todo is stored as a Map:

```dart
{
  'title': 'Complete Flutter Assignment',
  'isCompleted': false
}
```

The application performs the following operations:

* **Create:** `todoBox.add()`
* **Read:** `todoBox.values`
* **Update:** `todoBox.put()`
* **Delete:** `todoBox.delete()`

Because the data is stored locally, Todos remain available after restarting the application.

---

#  Screens

## Splash Screen

The application starts with a simple splash screen containing an SVG logo and application text.

The splash screen automatically navigates to the Home Screen after 5 seconds.

## Home Screen

The Home Screen displays all saved Todos in a clean list.

Each Todo provides:

* Completion checkbox
* Todo title
* Edit button
* Delete button

If there are no Todos, an empty-state message is displayed.

---

#  Short Technical Questions

## 1. What is the difference between StatelessWidget and StatefulWidget?

A `StatelessWidget` is used when the UI does not have mutable state that changes during its lifetime. A `StatefulWidget` is used when the UI needs to maintain and update changing state.

In this project, the Splash Screen uses `StatefulWidget` because it manages the splash timer, while the Home Screen is implemented using `StatelessWidget` with GetX reactive state management.

---

## 2. What is setState() used for in Flutter?

`setState()` is used inside a `StatefulWidget` to notify Flutter that the widget's state has changed. Flutter then rebuilds the widget so the updated data is reflected in the UI.

In this project, GetX's reactive state management is used instead of `setState()` for Todo data.

---

## 3. What is the difference between ListView and Column?

`Column` displays widgets vertically but does not provide scrolling by itself. It is generally suitable for a small number of widgets.

`ListView` provides a scrollable list and is suitable for displaying dynamic or large amounts of data. This project uses `ListView.builder()` for displaying Todos.

---

## 4. How would you handle an API call in Flutter?

I would use a networking package such as `http` or `dio` to make API requests. I would handle loading, success, and error states, parse the API response into models, and update the UI through a state management solution such as GetX.

---

## 5. What is the purpose of pubspec.yaml?

`pubspec.yaml` contains the Flutter project's metadata, Dart SDK constraints, dependencies, assets, fonts, and other project configuration.

In this project, it is also used to declare packages such as GetX, Hive Flutter, and Flutter SVG and to register the application's image assets.

---

## 6. Which Flutter project or feature have you worked on that you are most proud of, and what was your contribution?

I am most proud of working on **DreamCaster**, a flight and hotel booking application. My contribution included Flutter UI development, REST API integration, search and booking flows, debugging, and implementing responsive screens for the application.

---

# 🚀 Setup Instructions

## Prerequisites

Make sure Flutter and Dart are installed on your system.

Recommended environment:

```text
Flutter: 3.x
Dart: 3.x
Android Studio / VS Code
Android Emulator or Physical Android Device
```

## Installation

### 1. Clone the repository

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
```

### 2. Open the project

```bash
cd todo_app
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

---

# 📦 Build APK

To generate the release APK:

```bash
flutter build apk --release
```

The generated APK can be found at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

# 🧪 Testing

The application was tested on an Android emulator/device.

The following functionality was verified:

* Adding a Todo
* Displaying Todos
* Editing Todos
* Completing/uncompleting Todos
* Deleting Todos
* Empty state
* Local data persistence
* Splash screen navigation

---

# 📌 Assignment Requirements Covered

| Requirement           | Status |
| --------------------- | ------ |
| Add Task              | ✅      |
| Task List             | ✅      |
| Complete / Uncomplete | ✅      |
| Delete Task           | ✅      |
| Empty State           | ✅      |
| Clean UI              | ✅      |
| Local Storage         | ✅ Hive |
| Flutter & Dart        | ✅      |
| Source Code           | ✅      |
| APK                   | ✅      |
| README                | ✅      |

---

# 👨‍💻 Author

**Varun Rajpoot**

Flutter Developer

Indore, Madhya Pradesh, India

---

## 📄 License

This project was created for the **Flutter Developer Intern technical assignment** and is intended for evaluation purposes.
