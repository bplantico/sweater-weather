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

A forecast request returns the weather for a location passed in as a parameter in the format of `city,two letter state abbreviation`. Locations using a format of `city,country` (i.e. `denver,usa`, `nairobi,kenya`, `brisbane,aus`, etc) can also retrieve a response. The response includes summary, details, and future forecast sections.

## Example Request
```
GET http://the-real-sweater-weather.herokuapp.com/api/v1/forecast?location=milwaukee,wi

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
}
```

# <a name="backgrounds"></a>Backgrounds
`http://the-real-sweater-weather.herokuapp.com/api/v1/backgrounds?location=[city,state-abbreviation]`

A background request returns image url's for a location passed in as a parameter in the format of `city,two letter state abbreviation`. Locations using a format of `city,country` (i.e. `denver,usa`, `nairobi,kenya`, `brisbane,aus`, etc) or one location (i.e. `denver`, `oklahoma`, `london`, `france`, etc) can also retrieve a response.

## Example Request
```
GET http://the-real-sweater-weather.herokuapp.com/api/v1/backgrounds?location=milwaukee,wi

{
    "background_image_urls": [
        "https://live.staticflickr.com/1961/44830590694_b1d4a5aab3_o.jpg",
        "https://live.staticflickr.com/7155/6604080011_7b37f2f76d_o.jpg",
        "https://live.staticflickr.com/7276/7817741622_d4299fae7f_o.jpg",
        "https://live.staticflickr.com/7022/6603861857_02443e4ddb_o.jpg",
        "https://live.staticflickr.com/8185/8111973520_2756f63990_o.jpg",
        "https://live.staticflickr.com/2576/3789989253_890f0fb3aa_o.jpg",
        "https://live.staticflickr.com/2608/3771271505_df5a5c950b_o.jpg",
        "https://live.staticflickr.com/6087/6085802388_b092ac73af_o.jpg",
        "https://live.staticflickr.com/6090/6142851268_47a51d1998_o.jpg",
        "https://live.staticflickr.com/5781/21840684229_4ffcf270b3_o.jpg",
        "https://live.staticflickr.com/7309/8932282306_3491dd3d52_o.jpg",
        "https://live.staticflickr.com/7016/6615942029_4fa0e703d8_o.jpg",
        "https://live.staticflickr.com/7155/6591977885_59a747687c_o.jpg",
        "https://live.staticflickr.com/7011/6603871017_2ed5e4b570_o.jpg",
        "https://live.staticflickr.com/3512/3827187598_8f0a48c5db_o.jpg",
        "https://live.staticflickr.com/2523/3772956612_3c39ceb4be_o.jpg",
        "https://live.staticflickr.com/6170/6142290861_d296fbb07c_o.jpg",
        "https://live.staticflickr.com/7011/6608291875_f22f191126_o.jpg",
        "https://live.staticflickr.com/2663/3790799806_d8072af059_o.jpg",
        "https://live.staticflickr.com/3634/3633109008_fa4c6c7fa6_o.jpg",
        "https://live.staticflickr.com/2561/3772152951_dbfb041fc1_o.jpg"
    ]
}
```

# <a name="munchies"></a>Munchies
`http://the-real-sweater-weather.herokuapp.com/api/v1/munchies?start=[location]&end=[location]&food=[food_type]`

A munchies request takes in three parameters: a `start` location, an `end` location, and a `food` type and responds with three restaurants of the given food type which will be open taking into account the travel time between the start and end locations if the user leaves now.

## Example Request
```
GET http://the-real-sweater-weather.herokuapp.com/api/v1/munchies?start=boulder,co&end=denver,co&food=indian

{
    "city": "Denver",
    "restaurants": [
        {
            "name": "Biju's Little Curry Shop",
            "address": "1441 26th St"
        },
        {
            "name": "Spice Room | Neighborhood Indian Bistro",
            "address": "3157 W 38th Ave"
        },
        {
            "name": "Mehak India's Aroma",
            "address": "250 Steele St"
        }
    ]
}
```

# <a name="gifs"></a>Gifs
`http://the-real-sweater-weather.herokuapp.com/api/v1/gifs?location=denver,co`

A gifs request takes one location parameter and responds with five objects that represent forecasts. Each forecast contains a day timestamp (unix), a summary of the weather for that day, and a gif url based on the location and weather summary for that day.

## Example Request
```
GET http://the-real-sweater-weather.herokuapp.com/api/v1/gifs?location=denver,co

{
    "data": {
        "images": [
            {
                "time": "1565071200",
                "summary": "Foggy in the morning.",
                "url": "https://media0.giphy.com/media/3o7rbT3ECCXdEGE8fu/giphy.gif?cid=0e5cb8495d49d16575724b6659eb204d&rid=giphy.gif"
            },
            {
                "time": "1565157600",
                "summary": "Possible drizzle in the evening.",
                "url": "https://media0.giphy.com/media/RIlEe3erqB5Qch1PXe/giphy.gif?cid=0e5cb8495d49d16575724b6659a00d2f&rid=giphy.gif"
            },
            {
                "time": "1565244000",
                "summary": "Possible light rain in the evening.",
                "url": "https://media2.giphy.com/media/12slQrvE9rsu1q/giphy.gif?cid=0e5cb8495d49d16575724b6659d03acc&rid=giphy.gif"
            },
            {
                "time": "1565330400",
                "summary": "Possible light rain in the evening.",
                "url": "https://media2.giphy.com/media/12slQrvE9rsu1q/giphy.gif?cid=0e5cb8495d49d16575724b6659d03acc&rid=giphy.gif"
            },
            {
                "time": "1565416800",
                "summary": "Mostly cloudy throughout the day.",
                "url": "https://media3.giphy.com/media/YdUdx8jPIKhxe/giphy.gif?cid=0e5cb8495d49d1666a32724e41565116&rid=giphy.gif"
            }
        ],
        "copyright": "2019"
    }
 ```

# <a name="users"></a>Users
`http://the-real-sweater-weather.herokuapp.com/api/v1/users`

The users endpoint receives a post request with three parameters 1) an `email` address, 2) a `password`, and 3) a `password_confirmation`. If the email address has not already been used to create an account and the password and password_confirmations match, then an account is created for the user and the API responds with an API key.

If the email address provided matches an address already in the database and the passwords match the corresponding password, the user receives their API key in response.

If the email address provided matches an address already in the database but the passwords don't match or don't match the user's password, the response is an error message.

## Example Request
```
POST http://the-real-sweater-weather.herokuapp.com/api/v1/users?email=example@email.com&password=examplepassword&password_confirmation=examplepassword

Example response:
{
    "api_key": "sb1fnjXyRebyiABZFkpGhw"
}
```

# <a name="sessions"></a>Sessions
`http://the-real-sweater-weather.herokuapp.com/api/v1/sessions`

The sessions endpoint receives a post request with two parameters 1) an `email` address, 2) a `password`. If the email address provided matches an address already in the database and the passwords match the corresponding password, the user receives their API key in response.

If the email address provided matches an address already in the database but the password doesn't match the user's password, the response is an error message.

## Example Request
```
POST http://the-real-sweater-weather.herokuapp.com/api/v1/sessions?email=example@email.com&password=examplepassword

Example response:
{
    "api_key": "sb1fnjXyRebyiABZFkpGhw"
}
```

# <a name="road_trip"></a>Road Trip
`http://the-real-sweater-weather.herokuapp.com/api/v1/road_trip?origin=[location]&destination=[location]&api_key=[api key]`

The roadtrip endpoint receives a `POST` request with three parameters, 1) an `origin` location, 2) a `destination` location, and 3) an `api_key`. If the api key is active, the response is a JSON 1.0 object which includes a summary of the weather at the time of arrival to the destination and includes the temperature and estimated travel time.

## Example Request
```
POST http://the-real-sweater-weather.herokuapp.com/api/v1/road_trip?origin=denver,co&destination=loveland,co&api_key=FKSir1ILCmVjv_Mu6tI7Uw

Example response:
{
    "data": {
        "id": "1565123879_7",
        "type": "road_trip",
        "attributes": {
            "summary": "Partly Cloudy",
            "temperature": 93.14,
            "est_travel_time": 3566
        }
    }
}
```

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
