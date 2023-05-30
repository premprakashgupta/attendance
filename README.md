# Flutter Attendance App using GetX

This is a Flutter application that allows both teachers and students to register, create classes, take attendance, and provide assignments. The app is built using the GetX state management library.

## Features

- User Registration: Both teachers and students can register their accounts using email and password.
- User Authentication: Users can log in to the app using their registered email and password.
- User Roles: The app distinguishes between teachers and students based on their assigned roles.
- Create Classes: Teachers can create classes by providing class details such as class name, code, and other relevant information.
- Join Classes: Students can join classes by entering the class code provided by the teacher.
- Attendance Management: Teachers can mark daily attendance for each class and view attendance records.
- Assignment Creation: Teachers can create and provide assignments to students.
- Assignment Submission: Students can submit their assignments within the app.
- User Profiles: Users can view and update their profile information.

## Dependencies

This project utilizes the following dependencies:

- [GetX](https://pub.dev/packages/get): A powerful state management library for Flutter applications.
- [Firebase](https://firebase.google.com/): A suite of cloud-based tools and services for building and managing web and mobile applications.
- [Firebase Authentication](https://pub.dev/packages/firebase_auth): A Flutter plugin to enable authentication using Firebase.
- [Cloud Firestore](https://pub.dev/packages/cloud_firestore): A Flutter plugin to interact with the Cloud Firestore database in Firebase.
- [Cached Network Image](https://pub.dev/packages/cached_network_image): A Flutter library to load and cache network images.
- [Gap](https://pub.dev/packages/gap): A Flutter library to create gaps and spaces between widgets.

## Getting Started

To run this Flutter app locally, follow these steps:

1. Ensure that you have Flutter and Dart SDK installed on your machine.
2. Clone this repository or download the source code.
3. Open the project in your preferred IDE (e.g., Visual Studio Code).
4. Run `flutter pub get` in the project directory to install the dependencies.
5. Configure Firebase in your project by following the instructions in the [Firebase documentation](https://firebase.google.com/docs/flutter/setup).
6. Run `flutter run` to start the app on an emulator or connected device.

Please note that this is a simplified example, and you may need to configure additional Firebase services or make adjustments based on your specific requirements.

## Project Structure

The project follows a modular structure and adheres to the separation of concerns principle. Here's an overview of the project structure:

- **lib**: Contains the main application code.
  - **app**: Contains the core application logic and services.
    - **data**: Contains data models and repositories.
    - **modules**: Contains the different modules or screens of the application.
    - **routes**: Defines the application routes using GetX.
    - **services**: Contains services for authentication, database access, etc.
    - **utils**: Contains utility classes and helper functions.
  - **config**: Contains configuration files and constants.
  - **theme**: Contains the app's theme configuration.
  - **widgets**: Contains reusable widgets used throughout the app.

Feel free to explore the codebase and make any necessary modifications to suit your project requirements.

## Contributing

Contributions to this project are welcome. If you encounter any issues or have suggestions for improvements, please create an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code as per the terms of the license.

---

Thank you for your interest in this Flutter Attendance App using GetX. If you have any questions or need further assistance, please don't hesitate

to reach out. Happy coding!
