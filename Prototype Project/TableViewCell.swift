//
//  TableViewCell.swift
//  MVC
//
//  Created by Mark Moeykens on 5/2/17.
//  Copyright © 2017 Moeykens. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!
    @IBOutlet weak var profileImageStackView: UIStackView!
    
    func setup(model: Model) {
        titleLabel.text = model.title
        
        if model.subTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            subtitleLabel.isHidden = true
        }
        else{
             subtitleLabel.isHidden = false
            subtitleLabel.text = model.subTitle
        }
        data1Label.text = model.time
        data2Label.text = model.clock
        
        
        if model.image.count > 0
        {
            //if there are more images then populate the stackView of images. i.e profileStackViewImages outlet
            profileImageStackView.translatesAutoresizingMaskIntoConstraints = false
            //this would add constraints afterwards.
            
            for image in model.image {
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
                imageView.image = image
                imageView.layer.cornerRadius = 18
                imageView.clipsToBounds = true
                let height = imageView.heightAnchor.constraint(equalToConstant: 36)
                let width = imageView.widthAnchor.constraint(equalToConstant: 36)
                NSLayoutConstraint.activate([height,width])
                profileImageStackView.addArrangedSubview(imageView)
            }
        }
    }
}
