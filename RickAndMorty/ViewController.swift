//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Владимир on 06.02.2022.
//

import UIKit

class CharactersViewController: UICollectionViewController {
    
    private var characters = [Character]()
    private var charactersImage = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func openFilterCriterias(_ sender: UIBarButtonItem) {
        
    }
    
}

extension CharactersViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.charactersImage.count
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Character", for: indexPath) as! CharactersCollectionViewCell
         
//        cell.nameLabel.text = self.characters[indexPath.row].name
//        cell.statusLabel.text = self.characters[indexPath.row].status
        //cell.characterImageView.image = self.charactersImage[indexPath.row]

        return cell
    }
}
