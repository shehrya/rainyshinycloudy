//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Shehryar Khan on 30.07.17.
//  Copyright © 2017 Shehryar Khan. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "42a1771a0b787bf12e734ada0cfc80cb"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=42a1771a0b787bf12e734ada0cfc80cb"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=42a1771a0b787bf12e734ada0cfc80cb"


//let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
//let LATITUTE = "lat="
//let LONGITUTE = "&lon="
//let APP_ID = "&appid="
//let API_KEY = "42a1771a0b787bf12e734ada0cfc80cb"
//
//typealias DownloadComplete = () -> ()
//
//let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=42a1771a0b787bf12e734ada0cfc80cb"
////let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUTE)-36\(LONGITUTE)123\(APP_ID)\(API_KEY)"
//
//let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=42a1771a0b787bf12e734ada0cfc80cb"
////let FORECAST_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"
