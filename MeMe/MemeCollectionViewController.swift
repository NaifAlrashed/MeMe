//
//  MemeCollectionViewController.swift
//  MeMe
//
//  Created by Naif Alrashed on 2/7/17.
//  Copyright © 2017 Naif Alrashed. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes: [MeMe]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createMemePressed))
        
            let space:CGFloat = 3.0
            let dimension = (view.frame.size.width - (2 * space)) / 3.0
            
            flowLayout.minimumInteritemSpacing = space
            flowLayout.minimumLineSpacing = space
            flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        memes = delegate.memes
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            as! MemesCollectionViewCell
        cell.imageView.image = memes[indexPath.row].memedImage
        cell.label.text = memes[indexPath.row].topText + memes[indexPath.row].bottomText

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedController = self.storyboard?.instantiateViewController(withIdentifier: "DetailedMeme")
            as! DetailedMemeViewController

        detailedController.theImage = memes[indexPath.row].memedImage
        
        navigationController?.pushViewController(detailedController, animated: true)
    }
    
    func createMemePressed() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Editor")
        self.present(controller, animated: true, completion: nil)
    }
}
