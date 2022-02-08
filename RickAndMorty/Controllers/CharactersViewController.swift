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
        
        NetworkManager.shared.getCaracters(name: nil, status: nil, species: nil, gender: nil) { [weak self] (characters) in
            guard let self = self else {return}
            characters.forEach({
                NetworkManager.shared.getImage(fromUrl: $0.image) { (image) in
                    guard let image = image else { return }
                    DispatchQueue.main.async {
                        self.charactersImage.append(image)
                        self.collectionView.reloadData()
                    }
                }
            })
            DispatchQueue.main.async {
                self.characters = characters
            }
        }
        
    }
    

    @IBAction func openFilterCriterias(_ sender: UIBarButtonItem) {
        
    }
    
}

extension CharactersViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.charactersImage.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Character", for: indexPath) as! CharactersCollectionViewCell
        cell.nameLabel.text = self.characters[indexPath.row].name
        cell.statusLabel.text = self.characters[indexPath.row].status
        cell.characterImageView.image = self.charactersImage[indexPath.row]

        return cell
    }
}
