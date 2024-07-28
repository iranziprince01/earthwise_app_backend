# Earthwise Mobile App

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
4. [Backend](#backend)
5. [Usage](#usage)
6. [Contributing](#contributing)
7. [License](#license)
8. [Contact](#contact)

## Introduction

Welcome to the Earthwise mobile app! Earthwise is an innovative mobile application designed to help users lead a more sustainable lifestyle. The app provides tools and resources to track your environmental impact, discover eco-friendly products, and join a community of like-minded individuals committed to protecting our planet and empowering a greener future.

Demo video: [Click here...](https://drive.google.com/file/d/1cl0ZNuKb6JWnyEkKf7m_gmLZaiPLEtQ-/view?usp=sharing)

## Features

- **Carbon footprint Tracker**: Monitor your carbon footprint and water usage.
- **Eco-friendly Product Recommendations**: Find sustainable alternatives to everyday products.
- **Community Challenges**: Participate in challenges to reduce waste and conserve resources.
- **Educational Resources**: Access articles, videos, and tips on sustainability practices.
- **Personalized Tips**: Receive customized advice based on your habits and preferences.
- **Progress Dashboard**: Visualize your progress over time with detailed graphs and statistics.

## Installation

### Prerequisites

- [Android](https://developer.android.com/studio) or [iOS](https://developer.apple.com/xcode/) device
- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed

### Steps

1. **Clone the repository**
    ```bash
    git clone https://github.com/iranziprince01/earthwise_app.git
    cd earthwise_app
    ```

2. **Install dependencies**
    ```bash
    npm install
    ```

3. **Run the app**
    ```bash
    npm start
    ```

## Backend

The backend of the Earthwise mobile app is built using Firebase, which provides a range of services including authentication, real-time database, cloud storage, and hosting.

### Firebase Services Used

1. **Authentication**: 
    - Supports email/password and Google sign-in methods.
    - Securely manages user authentication and session handling.

2. **Firestore Database**: 
    - Stores user data, environmental impact logs, community challenges, and other app-related information.
    - Provides real-time synchronization of data across all devices.

3. **Cloud Storage**: 
    - Stores user-uploaded content such as profile pictures and challenge-related media.
    - Ensures secure and scalable storage solutions.

4. **Cloud Functions**: 
    - Executes backend logic and integrates with other Firebase services.
    - Handles complex operations and scheduled tasks.

### Backend Setup

1. **Firebase Configuration**: 
    - Create a Firebase project and configure the app with the Firebase credentials.
    - Add the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files to the project.

2. **Firestore Database Rules**: 
    - Set up Firestore rules to manage read and write permissions.
    ```plaintext
    service cloud.firestore {
      match /databases/{database}/documents {
        match /{document=**} {
          allow read, write: if request.auth != null;
        }
      }
    }
    ```

3. **Cloud Functions Deployment**: 
    - Write and deploy Cloud Functions using Firebase CLI.
    ```bash
    firebase deploy --only functions
    ```

4. **Authentication Integration**: 
    - Implement Firebase Authentication in the app to manage user sign-up, login, and session management.

## Usage

1. **Sign Up / Log In**: Create a new account or log in with your existing credentials.
2. **Setup Profile**: Complete your profile to get personalized tips and recommendations.
3. **Track Your Impact**: Log your daily activities to track your environmental impact.
4. **Join Challenges**: Participate in community challenges to motivate yourself and others.
5. **Explore Resources**: Access a wide range of educational materials on sustainability.

## Contributing

We welcome contributions from the community! To contribute:

1. **Fork the repository**
2. **Create a new branch**
    ```bash
    git checkout -b feature/earthwise_app
    ```
3. **Make your changes**
4. **Commit your changes**
    ```bash
    git commit -m 'Add some Earthwise feature'
    ```
5. **Push to the branch**
    ```bash
    git push origin feature/earthwise_app
    ```
6. **Open a pull request**

Please ensure your code meets our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the MIT License. Please take a look at the [LICENSE](LICENSE) file for details.

## Contact

For any questions or support, please reach out to our team at [support@earthwiseapp.com](mailto:support@earthwiseapp.com).

Thank you for using Earthwise and contributing to a greener planet!
