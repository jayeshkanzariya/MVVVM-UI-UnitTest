//
//  NewsViewModel.swift
//  Tec_Fake_PracticalTest
//
//  Created by Jayesh on 08/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//



import UIKit
import ObjectMapper
import AVFoundation
import Alamofire

protocol NewsViewModelProtocol {
    func reloadData()
}

class NewsViewModel {
    
    public var delegate : NewsViewModelProtocol?
    
    // MARK:- API CAll
    public func getNewsList(successCompletion : @escaping (_ newsList : [NewsModel]) -> (),errorHandler : @escaping (_ erromessage : String) -> ()){

        Alamofire.request(URL(string: APIEndPoint.GetNews)!, method: .get,parameters: ["sources":"google-news","apiKey":"cb9be5badbeb40c6b260b1a2a41b29ea"],encoding: URLEncoding.queryString).responseJSON { (response) in
            switch response.result{
                case .success(let value):
                    if let jsonResponse = value as? [String : AnyObject]{
                        if let articles = jsonResponse["articles"] as? [[String : Any]]{
                            let arrNews  = Mapper<NewsModel>().mapArray(JSONArray: articles)
                            successCompletion(arrNews)
                        }
                    }
                    break
                case .failure(let error):
                    errorHandler(error.localizedDescription)
                    break
            }
        }
    }
    
    private func height(forWidth size : CGSize,width: CGFloat) -> CGFloat {
        let boundingRect = CGRect(
            x: 0,
            y: 0,
            width: width,
            height: CGFloat(MAXFLOAT)
        )
        let rect = AVMakeRect(
            aspectRatio: size,
            insideRect: boundingRect
        )
        return rect.size.height
    }

    public func getImageHeight(imgUrl : String) -> CGFloat{
        if let url = URL(string: imgUrl){
            if let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil) {
                if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
                    let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! Int
                    let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! Int
                    let heightImage = height(forWidth: CGSize(width: CGFloat(pixelWidth), height: CGFloat(pixelHeight)), width: CGFloat(pixelWidth))
                    return heightImage
                }
            }
        }
        return 0
    }
}


