# LitPlay
This Flutter app is designed to provide users with an immersive video playback experience by integrating with different video APIs. The user-friendly interface ensures a seamless experience, offering smooth navigation between video categories, recommendations, and search options.
# Instructions on How to Run the Flutter Project:
1. Begin by cloning the repository to your local machine. If you haven’t already done so, use the following command in your terminal:
   git clone https://github.com/ogbuinya-princennamdi/flutter-video-player-app.git
2. Install Flutter SDK: flutter --version
3. Install Dependencies:flutter pub get
4. Set Up API Key for YouTube:
  a. Visit the Google Developer Console.
  b. Create a new project and enable the YouTube Data API v3 for the project.
  c. Go to the Credentials section and create an API key.
  d. Once you have the API key, replace YOUR_API_KEY with your actual YouTube API key in the relevant sections of the project

# Dependencies
  flutter_dotenv: ^5.2.1
  youtube_player_flutter: ^9.0.4
  shared_preferences: ^2.3.3

  # Flutter Litplay App

A Flutter app that allows users to search and play videos from various platforms, including YouTube, by integrating the YouTube Data API v3.

## Features
- Search for videos from YouTube.
- Play videos inside the app using the `youtube_player_flutter` package.
- Simple and intuitive UI to browse through videos and play them.

## Architecture

The app follows a **clean architecture** pattern with a focus on separation of concerns:

- **UI Layer (Presentation):** Flutter Widgets and UI components.
- **Data Layer:** Manages fetching video data from APIs, including handling YouTube API calls.
- **Domain Layer:** Defines business logic for video search, filtering, and playback.

This structure ensures maintainability and scalability, allowing the app to be easily extended to support additional video sources in the future.

## Setup Instructions

Follow these steps to run the app locally:

