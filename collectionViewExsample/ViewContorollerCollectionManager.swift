//
//  ViewContorollerCollectionManager.swift
//  collectionViewExsample
//
//  Created by Yasemin salan on 26.08.2023.
//

import UIKit
class ViewContorollerCollectionManager:NSObject{
    typealias RowItem = Person
    var collectionView:UICollectionView?
    var controller:ViewController?
    private let customCellIdentifier = "customCellIdentifier"
    private var items:[RowItem] = []
    
    //constructors oluşturuldu
     init( collectionView:UICollectionView,vc:ViewController) {
         super.init()
            self.collectionView = collectionView
            self.controller = vc
             configureCollectionView()
        
    }
    public func set(items:[RowItem]){
        self.items = items
        collectionView?.reloadData()
    }
    private func configureCollectionView(){
        //kullanacağımız cell i öncelikle tableview e tanıtmamız lazım register etmemiz gerekir.Yani bu cell i tanıyabilmesi ve kullanacağını bilmesi için
                //nib den oluşturulduğu için bu şekilde tanımlanır.
        collectionView?.register(.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: customCellIdentifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
}
extension ViewContorollerCollectionManager:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}
extension ViewContorollerCollectionManager:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: indexPath) as! CustomCollectionViewCell
       //index bilgisi cell e iletilmişdir.
        cell.row = indexPath.row
        cell.onButtonTapped = {row in
            print("butona tıklandı\(row)")
        }
        return cell
    }
}

//eğer kod tarafından tasarımı değiştirmek istiyorsak main  de collectionview özelliklerinde estimate Size'ı none yapıyoruz ve "min spacing" lerinde 0 yapıyoruz.

extension ViewContorollerCollectionManager:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
