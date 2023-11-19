//
//  DetailInteractor.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 19.11.2023.
//

import Foundation


class DetailInteractor {
    var delegate: DetailInteractorDelegate?
  
}

//Interactor protocol
extension DetailInteractor: DetailInteractorInputProtocol{
    func fetchWeatherData(_ urlString: String) {
//        istek atılacak
    }
    
    
   
   
    
    
}

