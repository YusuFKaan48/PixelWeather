<img src="https://github.com/YusuFKaan48/PixelWeather/assets/111217286/184c2f4c-71c6-45d6-8900-996a17c9b680" alt="GIF Caption" width="1024" height="360">

Pixel Weather provides users with real-time weather and location information, complemented by AI-generated images that adapt to the current weather conditions. All of this is presented in a charming pixel font.

# What I Used
* 🔨 UI Kit
* 🗺️ OpenWeather API (https://openweathermap.org/current)
* 🎨 Midjourney



# Welcome View Part

The LoginView is a login screen that utilizes the protocol-delegate pattern to handle the login event. When the user logs in for the first time, it requests the location information. Once the location is provided, the user is directed to the main application. Subsequent logins will directly redirect the user to the main application without requiring location input again. This functionality is achieved using User Defaults to store the location data.

First time example:

<img src="https://github.com/YusuFKaan48/PixelWeather/assets/111217286/207f7093-81d5-440d-908f-5af5ca130c64" alt="GIF Caption" width="187.5" height="406">


