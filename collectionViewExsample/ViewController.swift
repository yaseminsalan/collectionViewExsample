//
//  ViewController.swift
//  collectionViewExsample
//
//  Created by Yasemin salan on 25.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
 
    private var collectionHelper:ViewContorollerCollectionManager!
    
    private var people:[Person] = [
           .init(name: "Yasemin", age: 30),
           .init(name: "Ege", age: 29),
           .init(name: "Nursima", age: 20),
           .init(name: "Oktay", age: 22),
           .init(name: "Aslı", age: 45)]
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        collectionHelper = .init(collectionView: collectionView, vc: self)
        collectionHelper.set(items: people)
       
    }
   

}
