//
//  MainViewController.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 31/1/24.
//

import UIKit

class MainViewController: UIViewController {

    // Outlets para los elementos de la vista
    @IBOutlet weak var btRandomParagraph: UIButton!
    @IBOutlet weak var svTwoParagraph: UIStackView!
    @IBOutlet weak var tfLeftParagraph: UITextView!
    @IBOutlet weak var tfRightParagraph: UITextView!
    @IBOutlet weak var ivDronImage: UIImageView!
    
    // Instancia del ViewModel
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Llamamos a la función para generar texto aleatorio cuando la vista se carga
        generateRandomText()
        
        // Editar la imagen
        editImageView()
    }

    // Función para generar texto aleatorio y asignarlo a los UITextView
    func generateRandomText() {
        // Llamamos al método del ViewModel para generar texto aleatorio
        tfLeftParagraph.text = viewModel.generateRandomText(length: Int.random(in: 50...400))
        tfRightParagraph.text = viewModel.generateRandomText(length: Int.random(in: 50...400))
    }
    
    // Función para editar la imagen
       func editImageView() {
           // Establecer el radio de la esquina
           ivDronImage.layer.cornerRadius = 16
           ivDronImage.clipsToBounds = true
           
           // Agregar sombra
           ivDronImage.layer.shadowColor = UIColor.black.cgColor
           ivDronImage.layer.shadowOpacity = 0.8 // Esto aumenta la opacidad
           ivDronImage.layer.shadowOffset = CGSize(width: 0, height: 4) // Aumenta el desplazamiento hacia abajo
           ivDronImage.layer.shadowRadius = 6 // Aumentar el radio de la sombra
           
           // Otras ediciones de imagen (como cambiar el tamaño, cambiar la imagen, etc.) se pueden hacer aquí
       }
    
    // MARK: - IBAction
    @IBAction func btTapRandomParagraph(_ sender: Any) {
        generateRandomText()
    }
    
}

