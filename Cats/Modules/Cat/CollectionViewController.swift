//
//  CollectionViewController.swift
//  Cats
//
//  Created by Линар Нигматзянов on 23/07/2022.
//

import UIKit
import Kingfisher

final class CollectionViewController: UICollectionViewController {
    private let session = URLSession(configuration: .default)
    private let decoder = JSONDecoder()
    private var catsArray = [Cat]()
    private let detailVC = DetailVC()
    private let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cats"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView!.register(CatsCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        makeRequest()
        refresh.addTarget(self, action: #selector(refreshCV), for: .valueChanged)
        collectionView.addSubview(refresh)
    }

    
    
    @objc func refreshCV () {
        makeRequest()
        self.collectionView.reloadData()
        refresh.endRefreshing()
    }
    private func makeRequest () {
        guard let url = URL(string: ApiUrl.basicURL.rawValue) else { fatalError("nil") }
        let session = URLSession(configuration: .default)
         let task = session.dataTask(with: url) { [weak self] data, response, error in
             guard let cats = try? self!.decoder.decode([Cat].self, from: data ?? Data()) else {return}
             self!.catsArray = cats
             DispatchQueue.main.async {
                 self!.collectionView.reloadData()
             }
        }
        task.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsArray.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CatsCollectionViewCell
        
        var imageurl = catsArray[indexPath.row].image?.url
        cell.imageCell.kf.indicatorType = .activity
        if imageurl == nil {
            imageurl = ApiUrl.notFoundImageURL.rawValue
            cell.imageCell.kf.setImage(with: URL(string: imageurl!))
        } else {
            if let imageurl = catsArray[indexPath.row].image?.url {
                cell.imageCell.kf.setImage(with: URL(string: imageurl))
            }
        }
       
        cell.labelCountry.text = catsArray[indexPath.row].origin
        cell.labelBreeds.text = catsArray[indexPath.row].name
        return cell
    }
    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        detailVC.navTitle = catsArray[indexPath.row].name
        
        var imageurl = catsArray[indexPath.row].image?.url
        if imageurl == nil {
            imageurl = ApiUrl.notFoundImageURL.rawValue
            detailVC.catImageView.kf.setImage(with: URL(string: imageurl!))
        } else {
            if let imageurl = catsArray[indexPath.row].image?.url {
                detailVC.catImageView.kf.setImage(with: URL(string: imageurl))
            }
        }
        
        
        detailVC.temperamentLabel.text = catsArray[indexPath.row].temperament
        detailVC.descritionTextView.text = catsArray[indexPath.row].catDescription
        
        let childFriendlyCount = catsArray[indexPath.row].childFriendly
        let adaptabilityCount = catsArray[indexPath.row].adaptability
        let energyLevel = catsArray[indexPath.row].energyLevel
        let intelligence = catsArray[indexPath.row].intelligence
        let vocalisation = catsArray[indexPath.row].vocalisation
        let grooming = catsArray[indexPath.row].grooming
        
        show(detailVC, sender: nil)
        
        detailVC.addStar(text: "Child friendly", count: childFriendlyCount, x: 20, y: 300)
        detailVC.addStar(text: "Adaptability", count: adaptabilityCount, x: 20, y: 370)
        detailVC.addStar(text: "Energy Level", count: energyLevel, x: 20, y: 440)
        detailVC.addStar(text: "Intelligence", count: intelligence, x: 280, y: 300)
        detailVC.addStar(text: "Vocalisation", count: vocalisation, x: 280, y: 370)
        detailVC.addStar(text: "Grooming", count: grooming, x: 280, y: 440)
        
        
       
    }
    
}
