//
//  ViewController.swift
//  rainyshinycloudy
//
//  Created by Shehryar Khan on 20.07.17.
//  Copyright © 2017 Shehryar Khan. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class WeatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
//        locationManager.startUpdatingLocation()
//       locationManager.requestLocation()
        
        tableView.delegate = self
     
        tableView.dataSource = self
        
       currentWeather = CurrentWeather()
//        forecast = Forecast()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationAuthStatus()
    }
    func locationAuthStatus() {
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
  
        currentLocation = locationManager.location
//            if currentLocation != nil {
//                locationManager.stopUpdatingLocation()
//            }
            Location.sharedInstance.latitude = currentLocation?.coordinate.latitude
            
            Location.sharedInstance.longitude = currentLocation?.coordinate.longitude
            
            print("Lat :=: \(currentLocation?.coordinate.latitude) and Long :=: \(currentLocation?.coordinate.longitude)")
            currentWeather.downloadWeatherDetails {
                
                self.downloadForecastData{
                    self.updateMainUI()
//                     self.tableview.reloadData()
                    
                    
                }
                
            }
//            print(Location.sharedInstance.latitude, Location.sharedInstance.longitude)
        }
            
    else {
    
        locationManager.requestWhenInUseAuthorization()
//            locationAuthStatus()
        }
        
    }
    func downloadForecastData(completed: @escaping DownloadComplete) {
    
//        let forecastURL = URL(string: FORECAST_URL)
        Alamofire.request(FORECAST_URL).responseJSON {response in
        let result = response.result
            if let dict = result.value as? Dictionary <String ,AnyObject> {
                
                if let list = dict["list"] as? [Dictionary <String, AnyObject>]{
                    
                    for obj in list {
                    
                        let forecast = Forecast(weatherDict: obj)
                        
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                   self.forecasts.remove(at: 0)
                  self.tableView.reloadData()
                
                }
            
            
            }
            completed()
        }
    
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for:indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
        cell.configureCell(forecast: forecast)
            return cell

        }else
        {
         return WeatherCell()
        
        }
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }
}

