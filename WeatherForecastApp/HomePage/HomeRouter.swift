//
//  HomeRouter.swift
//  WeatherForecastApp
//
//  Created by Emine CETINKAYA on 18.11.2023.
//

import UIKit

class HomeRouter {
//    AppDelegate sınıfında burası uygulamanın başlangıcı olarak belirtildi(katman geçişlerini proje bilsin diye)
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        
        
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.delegate = presenter
        
        return view
    }
}


//MARK: HomeRouterProtocol
extension HomeRouter: HomeRouterProtocol {
//    TODO: Detay ekranı hazırlandığında bağlanacak
    func navigate(_ route: Routes) {
        switch route{
        case .detail:
            let vc = DetailRouter.createModule()
            
        }
        
    }

}

