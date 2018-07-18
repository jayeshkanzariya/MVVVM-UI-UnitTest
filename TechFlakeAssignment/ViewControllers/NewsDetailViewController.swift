//
//  NewsDetailViewController.swift
//  Tec_Fake_PracticalTest
//
//  Created by Jayesh on 08/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

class InformationCell : UITableViewCell{
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var lblInfo : UILabel!
    
}


class NewsDetailViewController: UIViewController {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDescription : UILabel!
    @IBOutlet weak var lblAuthor : UILabel!
    @IBOutlet weak var lblPublishedAt : UILabel!
    @IBOutlet weak var lblLink : UILabel!
    @IBOutlet weak var tblView : UITableView!
    var objNews : NewsModel?
    
    var information : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        information.append(objNews!.urlToImage!)
        
        if let author = objNews?.author,!author.isEmpty{
            information.append(author)
        }
        if let title = objNews?.title,!title.isEmpty{
            information.append(title)
        }
        if let description = objNews?.description,!description.isEmpty{
            information.append(description)
        }
        if let publishedAt = objNews?.publishedAt,!publishedAt.isEmpty{
            information.append(publishedAt)
        }
        if let link = objNews?.url,!link.isEmpty{
            information.append(link)
        }
        tblView.reloadData()
        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 60
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print(objNews)
    }
    
    func configureView(){
        imgView.sd_setImage(with: URL(string: objNews?.urlToImage ?? ""), completed: nil)
        lblTitle.text = objNews?.title ?? ""
        lblDescription.text = objNews?.description ?? ""
        lblAuthor.text = objNews?.author ?? ""
        lblPublishedAt.text = objNews?.publishedAt ?? ""
        lblLink.text = objNews?.url ?? ""
    }

    @IBAction func onclickLink(_ sender : UITapGestureRecognizer){
        self.performSegue(withIdentifier: "openLinkSegue", sender: self)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "openLinkSegue"{
            let vc = segue.destination as! WebViewViewController
            vc.url = objNews?.url
        }
    }

}

extension NewsDetailViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! InformationCell
            cell.imgView.sd_setImage(with: URL(string: information[indexPath.row]), completed: nil)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as! InformationCell
            cell.lblInfo.text = information[indexPath.row]
            return cell
        }
    }
    
}
