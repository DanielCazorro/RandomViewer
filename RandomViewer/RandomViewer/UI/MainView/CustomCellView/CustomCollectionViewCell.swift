//
//  CustomCollectionViewCell.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 12/2/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "CustomCollectionViewCell"

    // MARK: - IBOutlet
    @IBOutlet weak var imPicture: UIImageView!
    @IBOutlet weak var lbNameLabel: UILabel!
    @IBOutlet weak var lbAgeLabel: UILabel!
    @IBOutlet weak var lbSexLabel: UILabel!
    @IBOutlet weak var lbHobbiesLabel: UILabel!
    @IBOutlet weak var tvDescriptionTextView: UITextView!

//    // MARK: - Lifecycle
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    // Method to configure cell with user data
    func configureCustomCell(with name: String, age: Int, sex: String, hobbies: [String], description: String) {
        lbNameLabel.text = "Name: \(name)"
        lbAgeLabel.text = "Age: \(age)"
        lbSexLabel.text = "Sex: \(sex)"
        lbHobbiesLabel.text = "Hobbies: \(hobbies.joined(separator: ", "))"
        tvDescriptionTextView.text = "Description: \(description)"

        imPicture.image = UIImage(systemName: "person.circle")
    }
}
