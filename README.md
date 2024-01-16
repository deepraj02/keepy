![logo](docs/assets/header-file.png)

# Keepy (A note Taking App built with Flutter and Supabase)

## Table Of Contents

- [](#)
      - [About:](#About)
  - [Roadmap](#config)
  - [Overview](#overview)
  - [Setup and Config](#config)
  - [Contributing](#contributing)
    - [Creating A Pull Request](#creating-a-pull-request)

  
## About
A simple Note-taking Application created with Flutter and Supabase, which allows you to create, delete,update and delete notes.
It's a basic project at this time, but I'm planning to add more features to this Project with time.

## Overview
```
lib/
├── main.dart 
└── src
    ├── app.dart                                       (Settings Config and Routing)
    ├── features
    │   ├── auth                                       (Auth Feature)
    │   │   ├── presentation                           (UI Layer (Login,Signup))
    │   │   │   ├── login.page.dart
    │   │   │   └── signup.page.dart
    │   │   └── services                               (Auth Service(Logic))
    │   │       ├── auth.service.dart                  (Implementation)
    │   │       └── iauth.service.dart                 (Interface)
    │   └── notes                                      (Notes Feature)
    │       ├── presentation
    │       │   └── notes.page.dart 
    │       └── services
    │           ├── inotes.service.dart
    │           └── notes.service.dart                 (Supabase Database CRUD Ops)
    ├── localization
    │   └── app_en.arb
    ├── settings
    │   ├── settings_controller.dart 
    │   └── settings_service.dart
    └── shared
        ├── constants.dart                             (Constants for Supabase Secrets)
        └── styles.dart                                (Style Files for the Project)

```


## Config:
### Create a Supabase Project following this tutorial
[![](https://img.youtube.com/vi/6fFHgHqSbt8/0.jpg)](https://www.youtube.com/watch?v=6fFHgHqSbt8)
#### Turn off the RLS for this project

### Create a `constants.dart` file in the `lib/src/shared/` folder and add the following content in it

``` dart
import 'package:supabase_flutter/supabase_flutter.dart';

class ProjectConstants {
  static final SupabaseClient supaInstance = Supabase.instance.client;
  static const String supaUrl = '<YOUR_SUPABASE_URL>';
  static const String supaAnonKey = '<YOUR_SUPABASE_ANONKEY>';
}
```
*Replace the String with your project Constants.*

### Now in your `lib/main.dart` file add the following code in the main method:
```dart
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: ProjectConstants.supaUrl,
    anonKey: ProjectConstants.supaAnonKey,
  );

```
Restart your app and you're good to go.

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.
* If you have suggestions for adding or removing projects, feel free to [open an issue](https://github.com/deepraj02/keepy/issues/new) to discuss it, or directly create a pull request after you edit the *README.md* file with necessary changes.
* Please make sure you check your spelling and grammar.
* Create individual PR for each suggestion.


### Creating A Pull Request

- Fork the Project
- Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
- Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
- Push to the Branch (`git push origin feature/AmazingFeature`)
- Open a Pull Request (`choose the Staging branch From the Dropdown`)