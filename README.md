# Mini E-commerce UI

A mini e-commerce Flutter application that allows users to browse products, view product details, and add products to a cart.

## Architecture Notes

The project follows a feature-based architecture with a clean separation of layers:

- **Presentation:** Contains the UI of the application, built with Flutter widgets. It uses Riverpod for state management.
- **Domain:** Contains the business logic and entities of the application.
- **Data:** Contains the data sources and repositories.

### State Management

[Riverpod](https://riverpod.dev/) is used for state management. Providers are used to provide dependencies and manage the state of the application.

### Navigation

[AutoRoute](https://pub.dev/packages/auto_route) is used for navigation. It provides a simple and clean way to navigate between screens.

## How to Run

1.  Install Flutter: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
2.  Clone the repository.
3.  Install dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the code generation:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
5.  Run the application:
    ```bash
    flutter run
    ```

## FVM Support

This project uses [FVM (Flutter Version Management)](https://fvm.app/) to ensure that the correct Flutter version is used.
The required Flutter version is `3.35.3`.

To use FVM, install it and then run the following command in the project root directory:

```bash
fvm use 3.35.3
```

Then, run the application using FVM:

```bash
fvm flutter run
```

## Chosen Data Option

- **Product Data:** Product information is fetched from a local `products.json` file located in the `assets/json` directory.
- **Cart Data:** The shopping cart data is stored locally on the device using the `shared_preferences` package.

## How to Run Tests

To run the unit and widget tests, use the following command:

```bash
flutter test
```

You can also use FVM to run the tests:

```bash
fvm flutter test
```

## Exact Time Spent

_8h33m - (CodeTime extension used)_
