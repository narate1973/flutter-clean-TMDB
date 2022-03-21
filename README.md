# Nut the movie

This project is to demonstrate flutter with clean architecture.

## Pattern of state management

      Here i use "Bloc" pattern, because
    - This pattern separates business logic from UI
    - Easy to manage state whether global ( can be accessed from any widget )
      or local ( can only be accessed within the widget that provided )
      ** actually we can access it from other local bloc **
    - Easy to manage lifecycle of it self
    - Easy to debug with blocObserver
    - Easy to test with blocTest
    - Lastly, i also choose Bloc because i used to it.
        Anyway i'm still willing to use other state management ( riverpod, mobX )
        with incoming project soon.

## How i choose plugin library

    - match purpose
    - os support for android and ios ( for mobile )
    - ease of use
    - last update date
    - frequency of version update
    - pub point, popularity, like


# Getting Started
## First time run
```
git clone https://github.com/narate1973/flutter-clean-TMDB.git
cd nutthemovie
flutter pub get
flutter run
```
## To test with gherkin

Specify your device target id at test_driver/app_test.dart
```
dart test_driver/app_test.dart
```
After finish testing you can see report by doing
```
npm i
node cucumber_repo.js
```

## To test with flutter test
```
flutter test
```

## App architecture
![alt text](https://github.com/narate1973/nutthemovie/blob/main/flutter_clean.png?raw=true)


