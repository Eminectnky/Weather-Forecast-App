//
//  HomePresenter.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 18.11.2023.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    
   
}

//HomePresenterProtocol
extension HomePresenter: HomeInteractorDelegate {
    func handleOutput(_ output: HomeInteractorOutput) {
        
    }
    
    func fetchWeatherData(_ path: String) {
        print("Presenter")
        interactor?.fetchWeatherData(path)
    }
}
