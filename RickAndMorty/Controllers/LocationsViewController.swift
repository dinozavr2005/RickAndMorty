//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by Владимир on 07.02.2022.
//

import UIKit

class LocationsViewController: UICollectionViewController {
    
    private var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getLocations(name: nil, type: nil, dimension: nil) { [weak self] (locations) in
            guard let self = self else {return}
            self.locations = locations
            self.collectionView.reloadData()
        }
        
    }
}

extension LocationsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.locations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Location", for: indexPath) as! LocationCollectionViewCell
        cell.typeLabel.text = self.locations[indexPath.row].type
        cell.nameLabel.text = self.locations[indexPath.row].name
        return cell
    }
}
