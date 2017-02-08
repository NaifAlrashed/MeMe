//
//  MemeCollectionViewController.swift
//  MeMe
//
//  Created by Naif Alrashed on 2/7/17.
//  Copyright © 2017 Naif Alrashed. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes: [MeMe]!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createMemePressed))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        memes = delegate.memes
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
    
    func createMemePressed() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Editor")
        self.present(controller, animated: true, completion: nil)
    }
}
