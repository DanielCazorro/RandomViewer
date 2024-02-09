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
         
        let viewModel: MainViewModel = createViewModel()
         
        viewController.set(viewModel: viewModel)
        return viewController
    }

    // MARK: - Private methods
    private func createViewModel() -> MainViewModel {
        return MainViewModel()
    }
}
