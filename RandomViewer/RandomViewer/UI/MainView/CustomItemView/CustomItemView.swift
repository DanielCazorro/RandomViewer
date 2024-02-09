//
//  CustomItemView.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 9/2/24.
//

import UIKit

class CustomItemView: UIView {
    private let iconImageView = UIImageView()
    private let textLabel = UILabel()
    private let amountLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        // Configurar las subvistas (icono, texto, cantidad)
        addSubview(iconImageView)
        addSubview(textLabel)
        addSubview(amountLabel)

        // Agregar restricciones de diseño
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            amountLabel.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                // Restricciones para el icono
                iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                iconImageView.widthAnchor.constraint(equalToConstant: 30),
                iconImageView.heightAnchor.constraint(equalToConstant: 30),

                // Restricciones para el texto
                textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
                textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

                // Restricciones para la cantidad
                amountLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
                amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8) // Ajuste aquí
            ])
        
        // Configurar restricciones de diseño
        // (tamaño, posición, espaciado, etc.) usando Auto Layout

        // Puedes personalizar la apariencia de las subvistas aquí
    }

    func configure(with icon: UIImage, text: String, amount: Double) {
        iconImageView.image = icon
        textLabel.text = text
        amountLabel.text = String(format: "%.2f €", amount)
    }
}
