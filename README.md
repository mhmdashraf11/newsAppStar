# 📰 News App Star

A modern Flutter news application that delivers the latest headlines with a clean UI, offline caching, and smooth state management.

---

## ✨ Features

- 🗞️ Browse latest news articles
- 🔍 Search news by keyword or category
- 💾 Offline reading with local caching (Hive)
- ⚡ Fast & responsive UI with Google Fonts
- 🔄 State management with BLoC / Cubit

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| [Flutter](https://flutter.dev/) | Cross-platform UI framework |
| [Dart](https://dart.dev/) | Programming language |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | State management (Cubit) |
| [Dio](https://pub.dev/packages/dio) | HTTP client for API calls |
| [Hive](https://pub.dev/packages/hive) | Lightweight local database / caching |
| [Google Fonts](https://pub.dev/packages/google_fonts) | Custom typography |
| [Dartx](https://pub.dev/packages/dartx) | Dart extensions utilities |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.8.1`
- Dart SDK `^3.8.1`

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mhmdashraf11/newsAppStar.git
   cd newsAppStar
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation** (for Hive adapters)
   ```bash
   dart run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 📁 Project Structure

```
lib/
├── core/           # App-wide configs, themes, constants
├── features/       # Feature modules (news, search, etc.)
│   └── news/
│       ├── data/       # Models, repositories, data sources
│       ├── domain/     # Entities, use cases
│       └── presentation/
│           ├── cubit/  # State management
│           └── views/  # UI screens & widgets
└── main.dart
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^9.1.1   # State management
  dio: ^5.9.1             # Networking
  hive: ^2.2.3            # Local storage
  hive_flutter: ^1.1.0   # Hive Flutter integration
  google_fonts: ^8.0.2   # Typography
  dartx: ^1.2.0           # Dart extensions
```

---

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**Mohamed Ashraf**  
[GitHub](https://github.com/mhmdashraf11)
