# Tech C - Flutter Pokémon App

## 📱 About the Project

A Flutter application that displays a collection of Pokémon with their details, images, and information. The app features a clean design with proper navigation, state management, and follows Clean Architecture principles.

**Key Features:**
- Browse through various Pokémon
- View detailed Pokémon information
- Clean and intuitive user interface
- Multiple environment support (development, staging, production)
- Internationalization ready
- Comprehensive testing structure

## 📸 Screenshots

<div align="center">
  
<div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; margin: 20px 0;">
  <img src="https://github.com/user-attachments/assets/26adca64-c093-4d29-a27d-70a67b57335f" alt="App Home Screen" width="350" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);"/>
  <img src="https://github.com/user-attachments/assets/480c2482-f60f-40e3-b68b-b25e8c8651d6" alt="Navigation Menu" width="350" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);"/>
</div>

<div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; margin: 20px 0;">
  <img src="https://github.com/user-attachments/assets/6701aa8e-17b7-46b4-8ae0-8dfcb5227cf5" alt="Feature Details" width="350" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);"/>
  <img src="https://github.com/user-attachments/assets/cf808599-6e45-4d05-b3f1-d6e87efaa470" alt="Interactive Elements" width="350" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);"/>
</div>

<div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; margin: 20px 0;">
  <img src="https://github.com/user-attachments/assets/c35dd3d5-450e-4104-af6e-7b4ebf7bcc4e" alt="Settings Screen" width="350" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);"/>
  <img src="https://github.com/user-attachments/assets/ea72bb94-a3c9-4541-9f9d-31fef1f409d1" alt="Theme Options" width="350" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);"/>
</div>

</div>

---


## 🚀 How to Install

### Prerequisites

Before starting, make sure you have installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.8.1 or higher)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for device development)
- [Git](https://git-scm.com/)

### Check Flutter Installation

```bash
flutter doctor
```

### 1. Clone the Repository

```bash
git clone https://github.com/oiesc/tech_c.git
cd tech_c
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code Files

```bash
flutter packages pub run build_runner build
```

## ⚙️ Configuration

### 1. Environment Configuration

The project uses environment configuration files located in the `env/` folder:

- `development.json` - Development environment
- `staging.json` - Staging environment  
- `production.json` - Production environment
- `local.example.json` - Example for local configuration

#### Create Local Configuration

Copy the example file and configure with your variables:

```bash
cp env/local.example.json env/local.json
```

Edit the `env/local.json` file with your specific configurations.

### 2. Internationalization Configuration

The project supports multiple languages. To generate localization files:

```bash
flutter gen-l10n
```

### 3. Firebase Configuration (Optional)

If you plan to use Firebase:

#### Android
1. Add the `google-services.json` file to `android/app/`
2. The file is already configured in the project

#### iOS
1. Add the `GoogleService-Info.plist` file to `ios/Runner/`
2. The file is already configured in the project

## 🏃‍♂️ How to Run the Application

### Option 1: Command Line with Environment Configuration

```bash
# Development
flutter run --dart-define-from-file=env/development.json

# Staging
flutter run --dart-define-from-file=env/staging.json

# Production
flutter run --dart-define-from-file=env/production.json
```

### Option 2: VS Code with Configured Launch

If you're using VS Code, the launch configurations are already set up in `.vscode/launch.json`. Simply:

1. Open the project in VS Code
2. Go to the Debug panel (Ctrl/Cmd + Shift + D)
3. Select the desired environment from the dropdown
4. Press F5 or click the play button

Available launch configurations:
- **Development**: Runs with development environment
- **Staging**: Runs with staging environment  
- **Production**: Runs with production environment

## 📦 Build for Production

```bash
# Android (APK)
flutter build apk --release --dart-define-from-file=env/production.json

# Android (App Bundle - recommended for Play Store)
flutter build appbundle --release --dart-define-from-file=env/production.json

# iOS
flutter build ios --release --dart-define-from-file=env/production.json

# Web
flutter build web --release --dart-define-from-file=env/production.json
```

## 🧪 Running Tests

```bash
# All tests
flutter test

# Tests with coverage
flutter test --coverage

# Specific tests
flutter test test/features/home/
```

## 📋 Packages and Versions Used

### Main Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| `flutter` | SDK | Main framework |
| `flutter_localizations` | SDK | Internationalization support |
| `cupertino_icons` | ^1.0.8 | iOS icons |
| `intl` | ^0.20.2 | Internationalization |
| `go_router` | ^16.2.1 | Routing and navigation |
| `get_it` | ^8.0.2 | Dependency injection |
| `dio` | ^5.7.0 | HTTP client |
| `shared_preferences` | ^2.3.3 | Simple data persistence |
| `path_provider` | ^2.1.5 | System directories access |
| `json_annotation` | ^4.9.0 | JSON serialization annotations |
| `logger` | ^2.5.0 | Logging system |
| `package_info_plus` | ^8.1.1 | Package information |

**📝 Note**: This project uses a **custom State Management system (ValueStore)** instead of BLoC, Cubit, Riverpod, or Provider. While **Cubit** offers similar simplicity, we chose a custom implementation for zero dependencies and complete architectural control, offering greater simplicity and flexibility for direct method calls.

### Development Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| `flutter_test` | SDK | Testing framework |
| `flutter_lints` | ^6.0.0 | Linting rules |
| `build_runner` | ^2.4.13 | Code generation |
| `json_serializable` | ^6.8.0 | Automatic JSON serialization |
| `mockito` | ^5.4.4 | Mock for testing |

### Environment Versions

- **Dart SDK**: ^3.8.1
- **Flutter SDK**: Compatible with Dart 3.8.1+

## 📁 Project Structure

```
lib/
├── app/                          # Main application configuration
│   └── app.dart                  # Main app widget
├── features/                     # Feature modules
│   ├── home/                     # Home feature (Complete implementation)
│   │   ├── domain/               # Domain layer
│   │   │   ├── models/          # Domain models (HomeImage)
│   │   │   └── usecases/        # Use cases (HomeUsecase)
│   │   ├── infrastructure/       # Infrastructure layer
│   │   │   └── repositories/    # Repository implementations (HomeRepository)
│   │   ├── external/            # External data layer
│   │   │   ├── datasources/     # API data sources (HomeDatasource)
│   │   │   └── settings/        # Endpoint configuration
│   │   └── presentation/        # Presentation layer
│   │       ├── stores/          # State management (HomeStore)
│   │       ├── pages/           # UI pages
│   │       └── widgets/         # Feature-specific widgets
│   └── settings/                # Settings feature
│       └── pages/               # Settings pages
└── global/                      # Shared modules
    ├── app_core/               # Application core
    │   ├── domain/             # Core domain models (Either)
    │   ├── failures/           # Global failure classes
    │   └── store/              # State management system (ValueStore, AppState)
    ├── constants/              # Global constants (AppConfig)
    ├── l10n/                   # Internationalization (Generated)
    ├── network/                # HTTP client configuration (AppHttp)
    ├── services/               # Global services
    ├── settings/               # Global settings management
    ├── themes/                 # Application themes
    ├── router/                 # Route configuration (GoRouter)
    └── utils/                  # Global utilities (AppLogger, AppInfo)
```

## 🔄 State Management - ValueStore

### Why ValueStore Instead of BLoC/Cubit?

This project uses a custom state management system called **ValueStore** instead of the popular BLoC pattern. While **Cubit** offers similar simplicity to our ValueStore approach, we opted for a custom implementation for specific architectural needs. Here are the main reasons:

#### 🎯 **Simplicity and Flexibility**

**ValueStore:**
```dart
class HomeStore extends ValueStore<HomeDataModel> {
  final HomeUsecase _homeUsecase;
  
  HomeStore(this._homeUsecase) : super(const IdleState());

  // Direct methods - no need for events
  Future<void> loadData() async {
    updateState(const LoadingState());
    final result = await _homeUsecase.loadPokemonData();
    
    result.fold(
      (failure) => updateState(ErrorState(failure)),
      (data) => updateState(SuccessState(HomeDataModel(...))),
    );
  }

  void search(String query) {
    // Direct logic, no need to create events
    final filtered = _allPokemons.where((p) => 
      p.name.toLowerCase().contains(query.toLowerCase())
    ).toList();
    
    updateState(SuccessState(HomeDataModel(...)));
  }
}
```

**Equivalent BLoC would be:**
```dart
// Would need to create events
abstract class HomeEvent {}
class LoadDataEvent extends HomeEvent {}
class SearchEvent extends HomeEvent {
  final String query;
  SearchEvent(this.query);
}

// Then map events to states
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadDataEvent>(_onLoadData);
    on<SearchEvent>(_onSearch);
  }
  
  // More boilerplate...
}
```

#### 🚀 **ValueStore vs Cubit vs BLoC Comparison**

| Feature | ValueStore | Cubit | BLoC |
|---------|------------|-------|------|
| **Boilerplate** | Minimal | Minimal | High (events + states) |
| **Flexibility** | Direct methods | Direct methods | Only through events |
| **Testability** | Excellent | Excellent | Excellent |
| **Performance** | Optimized with ValueNotifier | Optimized with Streams | Optimized with Streams |
| **Learning Curve** | Low | Low | Medium/High |
| **Debugging** | Simple | Simple | Complex (streams) |
| **Custom Architecture** | Fully customizable | BLoC ecosystem dependent | BLoC ecosystem dependent |
| **Dependencies** | Zero external dependencies | Requires bloc package | Requires bloc package |

**💡 Why Custom Implementation Over Cubit?**

While **Cubit** provides similar simplicity to our ValueStore, we chose a custom implementation because:

1. **🎯 Zero Dependencies**: No need for the `bloc` package dependency
2. **🔧 Full Control**: Complete control over the state management architecture
3. **📚 Learning**: Demonstrates deep understanding of state management principles
4. **🎨 Customization**: Tailored specifically for our application's needs
5. **🚀 Performance**: Uses Flutter's native ValueNotifier for optimal performance
6. **🔍 Transparency**: Clear understanding of how state management works under the hood

#### 💡 **Key Features**

1. **Typed States**: `IdleState`, `LoadingState`, `SuccessState`, `ErrorState`
2. **Pattern Matching**: `when()` method for elegant state handling
3. **Listeners**: Reactive observation system
4. **Testability**: Easy mocking and state verification

#### 📝 **Usage Example in Widget**

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueStoreBuilder<HomeStore, HomeDataModel>(
      store: GetIt.I<HomeStore>(),
      builder: (context, state) {
        return state.when(
          idle: () => const Text('Ready to load'),
          loading: () => const CircularProgressIndicator(),
          success: (data) => PokemonList(pokemons: data.filteredPokemons),
          error: (error) => ErrorWidget(error: error),
        );
      },
    );
  }
}
```

## 🔧 Useful Scripts and Commands

### Development Scripts

```bash
# Clean build cache
flutter clean && flutter pub get

# Generate code and localization
flutter packages pub run build_runner build --delete-conflicting-outputs && flutter gen-l10n

# Code analysis
flutter analyze

# Check dependency updates
flutter pub outdated

# Update dependencies
flutter pub upgrade
```

## 🐛 Troubleshooting

### Common Issues

**Dependency errors:**
```bash
flutter pub deps
flutter pub cache repair
```

**build_runner issues:**
```bash
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

**Localization issues:**
```bash
flutter gen-l10n
```

**Corrupted build cache:**
```bash
flutter clean
cd ios && rm -rf Pods && rm Podfile.lock && cd ..
cd android && ./gradlew clean && cd ..
flutter pub get
```

## 📄 License

This project is licensed under the [MIT License](LICENSE).

**Developed by <a href="https://github.com/oiesc">oiEsc</a> with ❤️ using Flutter**
