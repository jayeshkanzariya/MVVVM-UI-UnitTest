//
//  NewsDetailViewController.swift
//  Tec_Fake_PracticalTest
//
//  Created by Jayesh on 08/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit




class NewsDetailViewController: UIViewController {

    @IBOutlet weak var tblView : UITableView!
    var objNewsDetailViewModel : NewsDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureTableView(){
        tblView.reloadData()
        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 60
        tblView.tableFooterView = UIView()
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
            vc.url = objNewsDetailViewModel.objNews.url
        }
    }

}

extension NewsDetailViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objNewsDetailViewModel.information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! NewsDetailInformationCell
            cell.imgView.sd_setImage(with: URL(string: objNewsDetailViewModel.information[indexPath.row]), completed: nil)
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as! NewsDetailInformationCell
            cell.configureTextInfoCell(textInfo: objNewsDetailViewModel.information[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if objNewsDetailViewModel.information[indexPath.row].contains("Link :"){
            self.performSegue(withIdentifier: "openLinkSegue", sender: self)
        }
    }
    
}
