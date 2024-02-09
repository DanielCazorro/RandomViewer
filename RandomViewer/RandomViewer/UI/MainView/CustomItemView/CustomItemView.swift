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
