//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Shehryar Khan on 07.08.17.
//  Copyright © 2017 Shehryar Khan. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {

    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
    
        if _date == nil {
        
            _date = ""
        }
        return _date
        
    
    }
    
    var weatherType: String {
    
        if _weatherType == nil {
        
            _weatherType = ""
            
        }
    return _weatherType
    }
    
    var highTemp: String {
    
        if _highTemp == nil {
        
            _highTemp = ""
        }
        
        return _highTemp
    }
    
    var lowTemp: String {
        
        if _lowTemp == nil {
            
            _lowTemp = ""
        }
        
        return _lowTemp
    }

    init(weatherDict: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
        
            if let min = temp["min"] as? Double {
                    
                    let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                    
                    let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                    
                    self._lowTemp = "\(kelvinToFarenheit)"
            }
            
            if let max = temp["max"] as? Double {
            
                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._highTemp = "\(kelvinToFarenheit)"
                
            
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary <String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
            
                self._weatherType = main
            }
        }
        
//        if let date = weatherDict["dt_txt"] as? String{
//            let dateFormatter = DateFormatter()
//            //This is the date string pattern match we are sending in from JSON
//            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//            //Convert our JSON date string to a Date type
//            let dateString = dateFormatter.date(from: date)
//            //Now rematch our expected output style
//            dateFormatter.dateFormat = "ha" //Shows only the hour and a AM/PM indicator
//            //Update our data model now
//            self._date = "\(dateFormatter.string(from: dateString!))"
//        

        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        
        
        }
        
    }

}


extension Date {
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: self)
        
        
}
}
