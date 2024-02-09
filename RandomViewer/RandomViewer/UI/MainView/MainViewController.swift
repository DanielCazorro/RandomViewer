//
//  MainViewController.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 31/1/24.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var btRandomParagraph: UIButton!
    @IBOutlet weak var svTwoParagraph: UIStackView!
    @IBOutlet weak var tfLeftParagraph: UITextView!
    @IBOutlet weak var tfRightParagraph: UITextView!
    @IBOutlet weak var ivDronImage: UIImageView!
    @IBOutlet weak var btRandomBox: UIButton!
    @IBOutlet weak var svBoxElements: UIStackView!
    
    // MARK: - Properties
    private var viewModel: MainViewModel?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Llamamos a la función para generar texto aleatorio cuando la vista se carga
        generateRandomText()
        
        // Editar la imagen
        editImageView()
        
        // Genera las vistas de la caja
        generateBoxViews()
    }
    
    // MARK: - Functions
    func set(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    // Genera las vistas de la caja
    private func generateBoxViews() {
        for _ in 0..<Int.random(in: 3...10) {
            let customItemView = CustomItemView()
            let icon = UIImage(systemName: "person.circle")
            let text = viewModel?.generateRandomText(length: Int.random(in: 10...120)) ?? ""
            let amount = Double.random(in: 10.0...1000.0)
            customItemView.configure(with: icon, text: text, amount: amount)
            svBoxElements.addArrangedSubview(customItemView)
            
            // Añadir la vista personalizada al StackView
            svBoxElements.addArrangedSubview(customItemView)
            
            // Aquí se podría configurar restricciones de tamaño de la vista
        }
    }
    
    // Función para generar texto aleatorio y asignarlo a los UITextView
    func generateRandomText() {
        // Llamamos al método del ViewModel para generar texto aleatorio
        tfLeftParagraph.text = viewModel?.generateRandomText(length: Int.random(in: 50...400))
        tfRightParagraph.text = viewModel?.generateRandomText(length: Int.random(in: 50...400))
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
    
    @IBAction func btTapRandomBox(_ sender: Any) {
    }
    // Generar aquí los elementos aleatorios de la caja
    
}


