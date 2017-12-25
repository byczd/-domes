//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by wumeng on 2017/11/28.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifer", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
    
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 50, height: 50)
//        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 1
//        layout.minimumLineSpacing = 1
//        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 30)
//        let collectionView = UICollectionView(frame:CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), collectionViewLayout: layout)
//        collectionView.backgroundColor = UIColor.white
//        self.view.addSubview(collectionView)
//
//        collectionView.delegate = self
//        collectionView.dataSource = self
//
//
//        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "identifer")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

