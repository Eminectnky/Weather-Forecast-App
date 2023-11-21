//
//  HomeInteractor.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 18.11.2023.
//

import Foundation
import Alamofire

class HomeInteractor {
    var delegate: HomeInteractorDelegate?
    let apiKey = AppConfig.openWeatherMapApiKey
    let baseURL = AppURL.baseUrl
}

//Interactor protocol
extension HomeInteractor: HomeInteractorInputProtocol{
 
    func fetchWeatherData(_ path: String) {
//        let apiUrl = "\(baseURL)\(path)"
         let apiUrl = "\(baseURL)&lat=44.34&lon=10.99&appid=\(apiKey)&units=metric"

         AF.request(apiUrl, method: .get).responseData { response in
             switch response.result {
             case .success(let data):
                 do {
                     let decoder = JSONDecoder()
                     let weatherModel = try decoder.decode(WeatherModel.self, from: data)
                     // Başarılı bir şekilde veri alındığında, bu veriyi presenter'a iletiyoruz.
                     self.delegate?.didReceiveWeatherData(weatherModel)
                 } catch {
                     // JSON parse hatası
                     print(error.localizedDescription)
                 }
             case .failure(let error):
                 // Network veya başka bir hata durumunda
                 print(error.localizedDescription)
             }
         }
     }

    
}


