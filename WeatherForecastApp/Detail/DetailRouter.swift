//
//  DetailRouter.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 19.11.2023.
//

import UIKit

class DetailRouter {
//    AppDelegate sınıfında burası uygulamanın başlangıcı olarak belirtildi(katman geçişlerini proje bilsin diye)
    static func createModule() -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        
        
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.delegate = presenter
        
        return view
    }
}

extension DetailRouter: DetailRouterProtocol {
    func navigate(_ route: DetailRoutes) {
        
    }

}

