//
//  MemeListViewController.swift
//  MeMe
//
//  Created by Naif Alrashed on 2/7/17.
//  Copyright © 2017 Naif Alrashed. All rights reserved.
//

import UIKit

class MemeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var memes: [MeMe]!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createMemePressed))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        memes = delegate.memes
        print(memes.count)
    }
    
    func createMemePressed () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memeEditorController = storyboard.instantiateViewController(withIdentifier: "Editor")
            as! MemeEditorViewController
        self.present(memeEditorController, animated: true, completion: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = memes[indexPath.row].topText + memes[indexPath.row].bottomText
        cell.imageView?.image = memes[indexPath.row].memedImage
        return cell
    }

}
