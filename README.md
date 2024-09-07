# Tasko
## Task Management App

A simple Task Management app built with Flutter that allows users to manage tasks, set due dates, and receive notifications for upcoming tasks. It also includes local storage using SQLite and displays motivational quotes using an external API.

## Features

- **Home Screen**: View a list of tasks with title, description, due date
- **Add Task**: Add  tasks with title, description, due date (using Date and Time picker), and status.
- **Navigation Drawer**: Access different screens like Home, Completed Tasks, and Settings.
- **State Management**: Managed using Bloc for efficient state management.
- **Local Storage**: Tasks are stored using SQLite for persistence when the app is closed.
- **Motivational Quotes**: Random quotes are fetched from the external [Quotes API](https://dummyjson.com/quotes/random) .
- **Notifications**: Local notifications to remind the user of tasks due soon using the `flutter_local_notifications` package.
- **Dark Mode (Optional)**: Toggle between light and dark mode.


## Getting Started

### Prerequisites

- Flutter SDK: [Flutter installation guide](https://flutter.dev/docs/get-started/install)
- Android Studio or Visual Studio Code (with Flutter plugin)

### Installation

1. Clone the repository and run the following commands:
   ```bash
   git clone https://github.com/NagesoHaile/tasko.git
   cd tasko
   flutter pub get
   flutter run

