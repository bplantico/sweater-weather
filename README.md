# SWEATER WEATHER

Welcome to SweaterWeather, a solo project completed by Brian Plantico during Module 3 at the Turing School of Software and Design. SweaterWeather is API which provides estimated travel times and customized forecast data by consuming third party API's including Google GeoCode, Google Directions, Yelp, Giphy, Flickr, and Dark Sky Weather.

SweaterWeather provides seven API endpoints to interact with:
+ [Forecast Request](#forecast)
+ [Backgrounds Request](#backgrounds)
+ [Munchies Request](#munchies)
+ [Gifs Request](#gifs)
+ [Users Request](#users)
+ [Sessions Request](#sessions)
+ [Road Trip Request](#road_trip)

# <a name="forecast"></a>Forecast
`http://the-real-sweater-weather.herokuapp.com/api/v1/forecast?location=[city,state-abbreviation]`
A forecast request returns the weather for a location passed in as a parameter in the format of `city,two letter state abbreviation`. The response includes summary, details, and future forecast sections.

## Example Request
```GET http://the-real-sweater-weather.herokuapp.com/api/v1/forecast?location=milwaukee,wi

{
    "currently": {
        "summary": "Mostly Cloudy",
        "temperature": "74°",
        "time_and_date": " 5:29 PM,  8/ 6",
        "high": "High: 80°",
        "low": "Low: 65°",
        "location": "Milwaukee, WI"
    },
    "details": {
        "icon": "rain",
        "today": "Today Possible drizzle in the morning.",
        "feels_like": "Feels Like 75°",
        "humidity": "Humidity 73%",
        "visibility": "Visibility 10.0 miles",
        "uv_index": "UV Index 6 (high)"
    },
    "forecast": {
        "hourly": [
            {
                "hour": " 5 pm",
                "hour_icon": "partly-cloudy-day",
                "hour_temp": "73°"
            },
            {
                "hour": " 6 pm",
                "hour_icon": "partly-cloudy-day",
                "hour_temp": "75°"
            },
            {
                "hour": " 7 pm",
                "hour_icon": "partly-cloudy-day",
                "hour_temp": "78°"
            },
            {
                "hour": " 8 pm",
                "hour_icon": "clear-day",
                "hour_temp": "80°"
            },
            {
                "hour": " 9 pm",
                "hour_icon": "clear-day",
                "hour_temp": "80°"
            },
            {
                "hour": "10 pm",
                "hour_icon": "clear-day",
                "hour_temp": "79°"
            },
            {
                "hour": "11 pm",
                "hour_icon": "clear-day",
                "hour_temp": "77°"
            },
            {
                "hour": "12 am",
                "hour_icon": "clear-day",
                "hour_temp": "76°"
            }
        ],
        "daily": [
            {
                "day": "Wednesday",
                "icon": "rain",
                "precipitation": "rain 43%",
                "high_temp": "↑ 84°",
                "low_temp": "↓ 67°"
            },
            {
                "day": "Thursday",
                "icon": "clear-day",
                "precipitation": "rain 24%",
                "high_temp": "↑ 80°",
                "low_temp": "↓ 60°"
            },
            {
                "day": "Friday",
                "icon": "clear-day",
                "precipitation": "rain 2%",
                "high_temp": "↑ 77°",
                "low_temp": "↓ 62°"
            },
            {
                "day": "Saturday",
                "icon": "partly-cloudy-day",
                "precipitation": "rain 2%",
                "high_temp": "↑ 80°",
                "low_temp": "↓ 66°"
            },
            {
                "day": "Sunday",
                "icon": "partly-cloudy-day",
                "precipitation": "rain 3%",
                "high_temp": "↑ 81°",
                "low_temp": "↓ 69°"
            }
        ]
    }
}```

# <a name="backgrounds"></a>Backgrounds

# <a name="munchies"></a>Munchies

# <a name="gifs"></a>Gifs

# <a name="users"></a>Users

# <a name="sessions"></a>Sessions

# <a name="road_trip"></a>Road Trip



* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
