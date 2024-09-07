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



## Task Management App - v1.0.0

### Release Notes
- Initial release of the Task Management app.
- Includes features for task management, notifications, and motivational quotes.

### Download APK
You can download the APK file from the following link:

[Download APK](https://objects.githubusercontent.com/github-production-release-asset-2e65be/853568918/daa112d4-ecea-4a11-8ef6-999091f12b2f?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20240907%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240907T165103Z&X-Amz-Expires=300&X-Amz-Signature=26ee03841e5fea2672df0aa1ca7129716d7be7807d11f5c4f6c7c5b4dde5bfd5&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=853568918&response-content-disposition=attachment%3B%20filename%3Dapp-release.apk&response-content-type=application%2Fvnd.android.package-archive)


