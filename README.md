# To-Do List App

A simple Flutter To-Do List application with CRUD operations.

## ✨ Features

- **Add Tasks** – Easily create new tasks.
- **Edit Tasks** – Modify existing tasks.
- **Delete Tasks** – Remove completed or unnecessary tasks.
- **Mark as Completed** – Toggle task status.
- **Filter** - Filter todos by pending/completed
- **Theme** - Change theme as per your taste dark/light/system
- **State Management** – Powered by Riverpod.

## 📦 Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/todo-app.git
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Generate freezed models and riverpod providers:
   ```sh
   dart run build_runner build --delete-conflicting-outputs
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## 📜 Folder Structure

```plaintext
lib/
│── core/                # App-wide utilities and themes
│── todo/            # Business logic and UI
│   ├── controller/     # State management
│   │   └── todo_provider.dart
│   ├── model/          # Data models
│   │   └── todo_model.dart
│   └── view/           # UI components
│       ├── pages/      # Page widgets
│       │   ├── manage_todo_page.dart
│       │   └── todo_page.dart
│       └── widgets/    # Custom widgets
│           └── todo_tile.dart
│── main.dart            # Entry point
│── app.dart             # Root widget
```

## 📱 Supported Platforms

- **iOS** – Compatible with iPhone.
- **Android** – Supports a wide range of Android devices.

## 👩‍💻 Author

[**Sireen**](https://github.com/Sireen-Official)

- **Phone**: [+91 9446604259](tel:+12025550199)
- **Email**: [sireenibnukabeer@gmail.com](mailto:sireenibnukabeer@gmail.com)
- **WhatsApp**: [https://wa.me/9446604259](https://wa.me/9446604259)
