# Flutter Todo App

A modern, feature-rich Todo application built with Flutter, offering an intuitive and beautiful user interface for managing your daily tasks.

## Features

- 📝 Create, edit, and delete todos
- 🏷️ Categorize todos (General, Work, Personal, Shopping)
- ⚡ Priority levels (Low, Medium, High)
- 📅 Due date management
- 🔍 Search functionality
- 🏷️ Category filtering
- ✅ Mark tasks as complete
- 💫 Beautiful Material Design 3 UI
- 📱 Responsive layout
- 🔄 Swipe-to-delete functionality

## Screenshots

![Screenshot_1745587585](https://github.com/user-attachments/assets/2a406864-b1be-47f5-addb-88b92bcf5ed0| width=500)
![Screenshot_1745587594](https://github.com/user-attachments/assets/d5642b79-6028-4340-a4b9-41f38a77f9e3| width=500)
![Screenshot_1745587613](https://github.com/user-attachments/assets/3e5f5b7b-c4b0-43cd-a05b-dd5d3304f6c3| width=500)
![Screenshot_1745587617](https://github.com/user-attachments/assets/8c47e18e-bcec-447a-81af-89d3389068b6| width=500)
![Screenshot_1745587620](https://github.com/user-attachments/assets/30485d11-b1fe-485b-bbf1-d74219764ae7| width=500)




## Getting Started

### Prerequisites

- Flutter SDK (>=3.2.3)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/todoapp.git
```

2. Navigate to the project directory
```bash
cd todoapp
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

## Project Structure

```
lib/
├── models/
│   └── todo.dart
├── theme/
│   └── app_theme.dart
├── widgets/
│   ├── todo_card.dart
│   └── todo_dialog.dart
└── main.dart
```

## Dependencies

- `intl: ^0.19.0` - For date formatting
- `flutter_lints: ^2.0.0` - For code quality

## Features in Detail

### Todo Management
- Create new todos with title, priority, category, and due date
- Edit existing todos
- Delete todos with swipe gesture
- Mark todos as complete/incomplete

### Organization
- Categorize todos into different groups
- Set priority levels for better task management
- Add due dates to track deadlines

### User Interface
- Clean and modern Material Design 3
- Intuitive navigation
- Smooth animations
- Responsive layout for all screen sizes
