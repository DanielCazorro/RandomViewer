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
    @IBOutlet weak var cvUsersCollectionView: UICollectionView!
    @IBOutlet weak var cvfUsersCollectionViewFlow: UICollectionViewFlowLayout!
    
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
        
        setupViewModel()
    }
    
    // MARK: - Functions
    func set(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupViewModel() {
        let dataManager = MainViewDataManager()
        viewModel = MainViewModel(dataManager: dataManager)
    }
    
    private func setupCollectionView() {
        // Setup collection view datasource and delegate
        cvUsersCollectionView.dataSource = self
        cvUsersCollectionView.delegate = self

        // Register collection view cells
        cvUsersCollectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "UserCell")
    }
    
    // Genera las vistas de la caja
    private func generateBoxViews() {
        // Eliminar las subvistas existentes
        svBoxElements.subviews.forEach { $0.removeFromSuperview() }
            
        for _ in 0..<Int.random(in: 3...10) {
            let customItemView = CustomItemView()
            guard let icon = UIImage(systemName: "person.circle") else {
                print("Error: No se pudo cargar la imagen")
                return
            }
            //let icon = UIImage(systemName: "person.circle")!
            let text = viewModel?.generateRandomText(length: Int.random(in: 10...120)) ?? ""
            let amount = Double.random(in: 10.0...1000000000000.0)
            customItemView.configure(with: icon, text: text, amount: amount)
            
            // Añadir la vista personalizada al StackView
            svBoxElements.addArrangedSubview(customItemView)
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
        generateBoxViews()
    }
    // Generar aquí los elementos aleatorios de la caja
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfUsers() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCollectionViewCell else {
            fatalError("Unable to dequeue UserCollectionViewCell")
        }

        // Configure cell with user data
        let userName = viewModel?.userName(at: indexPath.item) ?? ""
        let userAge = viewModel?.userAge(at: indexPath.item) ?? 0
        let userSex = viewModel?.userSex(at: indexPath.item) ?? ""
        let userHobbies = viewModel?.userHobbies(at: indexPath.item) ?? []
        let userDescription = viewModel?.userDescription(at: indexPath.item) ?? ""

        cell.configure(with: userName, age: userAge, sex: userSex, hobbies: userHobbies, description: userDescription)

        return cell
    }
    
}
