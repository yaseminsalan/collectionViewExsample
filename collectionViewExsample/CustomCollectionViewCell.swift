//
//  CustomCollectionViewCell.swift
//  collectionViewExsample
//
//  Created by Yasemin salan on 25.08.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    var onButtonTapped:((Int) -> ())?
    var row:Int!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonTapped(_ sender: Any) {

        //butona basıldığında closures tetiklenecekdir.
        onButtonTapped?(row)
    }
}
