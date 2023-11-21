//
//  DetailPresenter.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 19.11.2023.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    
   
}

//DetailPresenterProtocol
extension DetailPresenter: DetailInteractorDelegate {
    func handleOutput(_ output: DetailInteractorOutput) {
        
    }
    
    func fetchWeatherData(_ path: String) {
        print("Presenter")
    }
}

