//
//  MainViewController.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 31/1/24.
//

import UIKit

class MainViewController: UIViewController {

    // Outlets para los elementos de la vista
    @IBOutlet weak var svTwoParagraph: UIStackView!
    @IBOutlet weak var tfLeftParagraph: UITextView!
    @IBOutlet weak var tfRightParagraph: UITextView!
    
    // Instancia del ViewModel
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Llamamos a la función para generar texto aleatorio cuando la vista se carga
        generateRandomText()
    }

    // Función para generar texto aleatorio y asignarlo a los UITextView
    func generateRandomText() {
        // Llamamos al método del ViewModel para generar texto aleatorio
        tfLeftParagraph.text = viewModel.generateRandomText(length: Int.random(in: 50...400))
        tfRightParagraph.text = viewModel.generateRandomText(length: Int.random(in: 50...400))
    }

}

