//
//  MemeListViewController.swift
//  MeMe
//
//  Created by Naif Alrashed on 2/7/17.
//  Copyright © 2017 Naif Alrashed. All rights reserved.
//

import UIKit

class MemeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var memes: [MeMe]!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createMemePressed))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        memes = delegate.memes
        
        tableView.reloadData()
    }
    
    func createMemePressed () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let memeEditorController = storyboard.instantiateViewController(withIdentifier: "Editor")
            as! MemeEditorViewController
        self.present(memeEditorController, animated: true, completion: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection \(memes.count)")
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = memes[indexPath.row].topText + memes[indexPath.row].bottomText
        cell.imageView?.image = memes[indexPath.row].memedImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailedMeme")
            as! DetailedMemeViewController
        controller.theImage = memes[indexPath.row].memedImage
        
        navigationController?.pushViewController(controller, animated: true)
    }

}
