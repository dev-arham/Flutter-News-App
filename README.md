# News App

A Flutter-based News App that fetches and displays top headlines from various news sources using the [NewsAPI](https://newsapi.org/). The app allows users to browse top news articles, search for specific news, and view detailed content, including opening the full article in a web browser.

## Features

- Display top headlines from a specific news source (e.g., BBC News).
- Search for news articles by keyword.
- View article details, including images, titles, descriptions, and content.
- Open full articles in the browser using the `url_launcher` package.

## Installation

To clone and run this application, you'll need [Git](https://git-scm.com) and [Flutter](https://flutter.dev/docs/get-started/install) installed on your computer.

### Clone this repository

```bash
git clone https://github.com/onlymearham/Flutter-News-App.git
cd Flutter-News-App
```

### Install dependencies

```bash
flutter pub get
```

### Run the app

To run the app on an emulator or physical device:

```bash
flutter run
```

## Configuration

To fetch news from the NewsAPI, you'll need to sign up at [NewsAPI.org](https://newsapi.org/) and get your free API key.

Once you have your API key, replace the placeholder in your `env.dart` file with your actual API key:

```dart
const String apiKey = 'Your_API_Here';
```

Make sure that you follow the NewsAPI usage rules and limitations regarding free and paid usage.

## Packages Used

- [http](https://pub.dev/packages/http) - For making HTTP requests.
- [url_launcher](https://pub.dev/packages/url_launcher) - To open URLs in the browser.
- [flutter](https://flutter.dev/) - For building the cross-platform application.

## Project Structure

```
lib/
│
├── models/
│   ├── article_model.dart
│   └── source_model.dart
│
├── screens/
│   ├── news_list_page.dart
│   └── news_detail_page.dart
│
├── services/
│   └── api_service.dart
│
├── env.dart
└── main.dart
```

- `models/`: Contains the model classes for the articles and sources.
- `screens/`: Contains the UI code for displaying the list of articles and detailed article content.
- `services/`: Contains the API service to fetch data from NewsAPI.
- `env.dart`: Stores the API key.
- `main.dart`: The main entry point of the application.

## Contribution

Contributions are welcome! If you want to contribute to this project, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

### Explanation:
1. **Installation**: Instructions for cloning and running the app.
2. **Configuration**: Explanation for setting up the API key.
3. **Packages Used**: Lists the packages used in the project.
4. **Project Structure**: Provides an overview of the project files.
5. **License**: Placeholder for a license file (MIT in this example).