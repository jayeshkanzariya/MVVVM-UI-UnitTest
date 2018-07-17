//
//  NewsDetailViewController.swift
//  Tec_Fake_PracticalTest
//
//  Created by Jayesh on 08/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblDescription : UILabel!
    @IBOutlet weak var lblAuthor : UILabel!
    @IBOutlet weak var lblPublishedAt : UILabel!
    @IBOutlet weak var lblLink : UILabel!
    
    var objNews : NewsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
