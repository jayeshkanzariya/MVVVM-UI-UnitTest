//
//  NewsListViewController.swift
//  TechFlakeAssignment
//
//  Created by Jayesh on 16/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

import UIKit
import SDWebImage



class NewsListViewController: UIViewController {
    
    let viewModel = NewsViewModel()
    @IBOutlet weak var collectionView : UICollectionView!
    
    var arrNewsList : [NewsModel] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getNewsList(successCompletion: { (news) in
            self.arrNewsList = news
        }) { (errorMsg) in
            print(errorMsg)
        }
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue"{
            let destVC = segue.destination as! NewsDetailViewController
            destVC.objNews = sender as? NewsModel
        }
    }
    
    
}

extension NewsListViewController : NewsViewModelProtocol{
    func reloadData() {
        print(arrNewsList)
        self.collectionView.reloadData()
    }
}

// MARK :- CollectionView DataSource,Delegate Methods
extension NewsListViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNewsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsInfoCollectionViewCell.identifier, for: indexPath) as! NewsInfoCollectionViewCell
        cell.configureCell(obj: arrNewsList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetailSegue", sender:arrNewsList[indexPath.item])
    }
}

// MARK :- CollectionView Custom Layout Delegate
extension NewsListViewController : PinterestLayoutDelegate {
    
    // Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return viewModel.getImageHeight(imgUrl: arrNewsList[indexPath.item].urlToImage ?? "")
    }
    
}
