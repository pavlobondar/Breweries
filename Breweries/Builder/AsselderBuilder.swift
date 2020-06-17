//
//  Builder.swift
//  Breweries
//
//  Created by Pavel Bondar on 17.06.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import UIKit

protocol AsselderBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createMapModule(location: Location?, router: RouterProtocol) -> UIViewController
}

class AsselderModuleBuilder: AsselderBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = BreweryView()
        let networkService = NetworkService()
        let presenter = BreweriesPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    func createMapModule(location: Location?, router: RouterProtocol) -> UIViewController {
        let view = MapView()
        let networkService = NetworkService()
        let presenter = MapPresenter(view: view, networkService: networkService, location: location)
        view.presenter = presenter
        return view
    }
}