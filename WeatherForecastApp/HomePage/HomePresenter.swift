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
    
    //Interactordaki istek fonksiyonunu tetikliyor
    func fetchWeatherData(_ path: String) {
        interactor?.fetchWeatherData(path)
    }
   
}

//HomePresenterProtocol
extension HomePresenter: HomeInteractorDelegate {

    //Interactordan alınan veriler view a gönderilecek
    func didReceiveWeatherData(_ weatherModel: WeatherModel) {
        view?.didReceiveWeatherData(weatherModel)
    }

}
