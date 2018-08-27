
/*
 This is where you will be getting your data from a different source.
 */

import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            data.append(Model(title: "Finish Home Screen", subTitle: "Web Apps", image: [], time: "8", clock: "AM"))
            data.append(Model(title: "Lunch Break", subTitle: "", image: [], time: "11", clock: "AM"))
            data.append(Model(title: "Design Stand UP", subTitle: "Hangouts", image: getImages(), time: "4", clock: "PM"))
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
    
    static func getImages() -> [UIImage] {
        var images = [UIImage]()
        images.append(#imageLiteral(resourceName: "Profile1"))
        images.append(#imageLiteral(resourceName: "Profile2"))
        images.append(#imageLiteral(resourceName: "Profile3"))
        return images
    }
    
    static func getDayAndWeather(completion: @escaping (DayWeatherModel?) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            let data = DayWeatherModel(dayName: "Sunday", longDate: "August 8, 2018 ", temperature: "29°", weatherIcon: #imageLiteral(resourceName: "WeatherSun"), city: "Windsor")
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
}
