//
//  MainViewWireframe.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 9/2/24.
//

import Foundation

import UIKit

class MainViewWireframe {
    
    // MARK: - Properties
     var viewController: MainViewController {
        // Generating module components
        let viewController = MainViewController()
        let dataManager = createDataManager()
        let viewModel: MainViewModel = createViewModel(with: dataManager)
         
        viewController.set(viewModel: viewModel)
        return viewController
    }

    // MARK: - Private methods
    private func createViewModel(with: MainViewDataManager) -> MainViewModel {
        return MainViewModel(dataManager: MainViewDataManager())
    }
    
    private func createDataManager() -> MainViewDataManager {
        return MainViewDataManager()
    }
}
