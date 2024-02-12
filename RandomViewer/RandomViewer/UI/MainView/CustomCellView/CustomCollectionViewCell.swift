//
//  CustomCollectionViewCell.swift
//  RandomViewer
//
//  Created by Daniel Cazorro Frias  on 12/2/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlet
    @IBOutlet weak var imPicture: UIImageView!
    @IBOutlet weak var lbNameLabel: UILabel!
    @IBOutlet weak var lbAgeLabel: UILabel!
    @IBOutlet weak var lbSexLabel: UILabel!
    @IBOutlet weak var lbHobbiesLabel: UILabel!
    @IBOutlet weak var tvDescriptionTextView: UITextView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
