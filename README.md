# RadioApp
Radio Streaming Application 

This Radio Streaming Application is an iOS app built using Swift and UIKit, showcasing modern mobile development practices with asynchronous network calls, persistent storage, and dynamic user interfaces.

Framework Features Used
•	Asynchronous Network Calls: Uses URLSession for fetching radio station data from an external API. Network calls are handled asynchronously, ensuring a responsive user interface.
•	Error Handling: Implements robust error handling for network operations, ensuring graceful handling of failures and invalid data.
•	Local Storage Interaction: Utilizes UserDefaults to persist user data such as favorite and recently played radio stations. This allows the app to maintain state across sessions.
•	Delegate Pattern: Employs the delegate pattern to handle user interactions and data passing between view controllers, promoting a clean and modular codebase.
•	Component Management: Uses custom UITableViewCell subclasses and UIViewControllers to modularize and manage different parts of the user interface efficiently.
•	UI Updates: Ensures that all UI updates are performed on the main thread, providing a smooth user experience.
•	Dynamic UI Elements: Implements conditional rendering and dynamic UI updates based on the application state, such as updating the currently playing radio station and its corresponding metadata.
•	Audio Playback: Utilizes AVPlayer for streaming audio content, allowing users to play, pause, and switch between radio stations seamlessly.
•	Responsive Design: Ensures that the app layout adapts to different screen sizes and orientations, providing a consistent user experience across all iOS devices.

Application Overview

This iOS-based radio streaming application allows users to explore and listen to a wide variety of radio stations. It provides functionalities to search for radio stations by country, language, or tag, manage a list of favorite stations, and view a history of recently played stations.

Key Features
•	Radio Station Search: Allows users to search for radio stations by country, language, or tag using a search bar with dynamically updated results.
•	Song Playback Controls: Provides intuitive playback controls including play, pause, and stop.
•	Favorites Management: Users can add their favorite radio stations to a persistent favorites list stored in UserDefaults.
•	History Tracking: Maintains a history of recently played radio stations, allowing users to easily revisit them.
•	Persistent State: The app preserves user data across sessions using UserDefaults, ensuring a seamless user experience.
•	Dynamic UI: Updates the currently playing radio station's name, image, and metadata dynamically, providing real-time feedback to the user.
•	Responsive Design: Adapts the layout to different screen sizes and orientations, ensuring a consistent and user-friendly interface.

About Swift and UIKit
•	Modern Language: Swift is a powerful and intuitive programming language for iOS development, known for its performance and safety features.
•	UIKit Framework: UIKit is a comprehensive framework for building user interfaces on iOS. It provides a wide range of components and tools to create visually appealing and responsive apps.
•	Asynchronous Programming: Swift's async/await features and GCD (Grand Central Dispatch) enable efficient handling of background tasks, such as network calls, without blocking the main thread.
•	Declarative UI Updates: UIKit's reactive nature allows for dynamic updates to the user interface in response to changes in the app's state.
•	Robust Ecosystem: Swift and UIKit benefit from a rich ecosystem of libraries and tools that streamline the development process and enhance app capabilities.
By leveraging these features, the Radio Streaming Application offers a rich, responsive, and user-friendly experience for exploring and enjoying radio stations from around the world.
