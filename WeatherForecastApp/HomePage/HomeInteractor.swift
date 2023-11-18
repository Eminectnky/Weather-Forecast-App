//
//  HomeInteractor.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 18.11.2023.
//

import Foundation


class HomeInteractor {
    var delegate: HomeInteractorDelegate?
  
}

//Interactor protocol
extension HomeInteractor: HomeInteractorInputProtocol{
    func fetchWeatherData(_ urlString: String) {
//        istek atılacak
    }
    
    
   
   
    
    
}
