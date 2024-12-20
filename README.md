<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

 <h1>Timesheet Application - Basic Version</h1>

 <h2>Introduction</h2>
    <p>The Timesheet Application is a Flutter-based mobile app designed to manage and track time across projects and tasks. The app allows users to authenticate, view a list of assigned projects, and see the tasks associated with each project. It integrates with an API for user authentication and task management. Additionally, Google Maps is used to provide location-based features, and state management is handled using the Provider package.</p>

   <h2>Features</h2>
    <ul>
        <li>User Login: Authenticate the user through the provided API.</li>
        <li>Project List: Fetch and display a list of assigned projects.</li>
        <li>Task List: Fetch and display a list of tasks for a selected project.</li>
        <li>Google Maps Integration: Display relevant location-based data.</li>
        <li>State Management: Uses the Provider package to manage application state.</li>
    </ul>

<h2>Technologies Used</h2>
    <ul>
        <li>Flutter</li>
        <li>Dart</li>
        <li>API Integration: Fetch data from <a href="https://api.brandexperts.ae/api/">https://api.brandexperts.ae/api/</a>.</li>
        <li>Google Maps</li>
        <li>Provider (State Management)</li>
        <li>Dio for network requests</li>
    </ul>

 <h2>Installation</h2>
    <h3>Prerequisites</h3>
    <ul>
        <li>Install Flutter from <a href="https://flutter.dev/docs/get-started/install">flutter.dev</a>.</li>
        <li>Install Dart SDK (comes with Flutter).</li>
        <li>Android Studio or Visual Studio Code with Flutter and Dart extensions.</li>
        <li>A physical or virtual device to run the application.</li>
    </ul>
    <h3>Steps to Run the App</h3>
    <ol>
        <li>Clone the repository:</li>
        <pre><code>git clone https://github.com/Akhilaanil104/time_sheet_app.git</code></pre>
        <pre><code>cd time_sheet_app</code></pre>
        <li>Install dependencies:</li>
        <pre><code>flutter pub get</code></pre>
        <li>Configure API: Make sure to configure the API base URL and endpoint properly in your app.</li>
        <li>Run the App:</li>
        <pre><code>flutter run</code></pre>
    </ol>

   <h2>Screenshots</h2>
    <h3>Login Screen</h3>
    <figure>
        <img src="assets\images\SCREENSHOT5.jpg" alt="Login Screen" width="400">
        <figcaption>Login screen where users authenticate using the API.</figcaption>
    </figure>

  <h3>Project List Screen</h3>
    <figure>
        <img src="assets\images\SCREENSHOT1.jpg" alt="Project List Screen" width="400">
        <figcaption>Displays the list of assigned projects for the logged-in user.</figcaption>
    </figure>

   <h3>Task List Screen</h3>
    <figure>
        <img src="assets\images\SCREENSHOT2.jpg" alt="Task List Screen" width="400">
        <figcaption>Displays the list of tasks associated with the selected project.</figcaption>
    </figure>
    
<h3>Project Details Screen with Google Maps</h3>
<figure>
    <img src="assets\images\SCREENSHOT3.jpg" alt="Project Details with Google Maps" width="400">
    <figcaption>Displays detailed project information along with the location on Google Maps for the selected project.</figcaption>
</figure>

 <h2>Google Maps Integration</h2>
    <p>Google Maps is used to display relevant location information in the app. The map shows the location of the tasks or projects based on the data from the API. Make sure to configure your Google Maps API key in the app for it to function correctly.</p>
    <ul>
       <li><a href="https://developers.google.com/maps/documentation/android-sdk/get-api-key">Get your Google Maps API Key</a></li>
    </ul>
    <h3>Adding the API Key to Your App</h3>
    <p>1. Open the <code>android/app/src/main/AndroidManifest.xml</code> file.</p>
    <p>2. Add your Google Maps API key inside the <code>&lt;application&gt;</code> tag:</p>
    <pre><code>&lt;meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_GOOGLE_MAPS_API_KEY"/&gt;</code></pre>

 <h2>State Management with Provider</h2>
    <p>This app uses the <strong>Provider</strong> package for state management. The state is separated into models for the user, projects, and tasks. The data is fetched asynchronously and updated in the UI using the <code>ChangeNotifierProvider</code>.</p>

</body>
</html>
