//
//  DetailVC.swift
//  Cats
//
//  Created by Линар Нигматзянов on 24/07/2022.
//

import UIKit

final class DetailVC: UIViewController {
    
    var navTitle = ""
    
    public let catImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 75, y: 100, width: 150, height: 150)
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    public let temperamentLabel: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 20, y: 270, width: UIScreen.main.bounds.width - 40, height: 100)
        label.font = .boldSystemFont(ofSize: 27)
        label.textAlignment = .center
        label.autoresizingMask = .flexibleWidth
        label.numberOfLines = 0
        return label
    }()
    
    public let descritionTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 5, y: 600, width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height - 600)
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 30)
        return textView
    }()
    
    private let backView: UIView = {
       let view = UIView()
        view.backgroundColor = .cyan
        view.alpha = 1
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 600)
    
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = navTitle
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        
        backView.addSubview(catImageView)
        backView.addSubview(temperamentLabel)
        view.addSubview(descritionTextView)
        view.addSubview(backView)
        if  let nc = self.navigationController {
            setupAppearanceNavigationBar(with: nc)
        }
       
        
    }
    
    public func addStar(text: String,count: Int, x: CGFloat, y: CGFloat) {
        var myX = x
        let label = UILabel()
        label.frame = CGRect(x: x, y: y, width: 150, height: 200)
        label.text = text
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.textColor = .gray
        
        
        for _ in 0..<count {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "star")
            imageView.contentMode = .scaleAspectFill
            imageView.frame = CGRect(x: myX, y: label.frame.midY + 20, width: 20, height: 20)
            myX += 20
            view.addSubview(imageView)
        }
        view.addSubview(label)
        
     
        
    }


}
