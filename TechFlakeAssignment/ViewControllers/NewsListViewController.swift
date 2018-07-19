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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        getNews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNews(){
        self.showActivityIndicator()
        viewModel.getNewsList(successCompletion: { (news) in
            self.hideActivityIndicator()
            self.collectionView.reloadData()
        }) { (errorMsg) in
            self.hideActivityIndicator()
            print(errorMsg)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue"{
            let destVC = segue.destination as! NewsDetailViewController
            destVC.objNewsDetailViewModel = NewsDetailViewModel(objNews: sender as! NewsModel)
        }
    }
    
    
}

// MARK :- CollectionView DataSource,Delegate Methods
extension NewsListViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arrNewsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsInfoCollectionViewCell.identifier, for: indexPath) as! NewsInfoCollectionViewCell
        cell.configureCell(obj: viewModel.arrNewsList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetailSegue", sender:viewModel.arrNewsList[indexPath.item])
    }
}

// MARK :- CollectionView Custom Layout Delegate
extension NewsListViewController : PinterestLayoutDelegate {
    
    // Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        guard let imgUrl = URL(string: viewModel.arrNewsList[indexPath.item].urlToImage ?? "")else{
            return 0
        }
        if let sizeOfImage = imgUrl.getSizeOfImage(){
            return sizeOfImage.getHeightAccordingWidthRatio()
        }
        else{
            return 0
        }
    }
    
}
