//
//  CatsCollectionViewCell.swift
//  Cats
//
//  Created by Линар Нигматзянов on 23/07/2022.
//

import UIKit
import Kingfisher

final class CatsCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    
    public let labelCountry: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    public let labelBreeds: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    public var imageCell: UIImageView  = {
       let image = UIImageView()
        image.clipsToBounds = true
         image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 0.3
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.clipsToBounds = true
        contentView.addSubview(labelCountry)
        contentView.addSubview(imageCell)
        contentView.addSubview(labelBreeds)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        imageCell.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 200)
        labelCountry.frame = CGRect(x: 10, y: imageCell.frame.size.height + 20 , width: 150, height: 50)
        labelBreeds.frame = CGRect(x: 10, y: labelCountry.frame.midY, width: 200, height: 50)
    }
    
    
    
}
