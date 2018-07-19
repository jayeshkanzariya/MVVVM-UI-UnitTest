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


class NewsViewModel {
    
    var arrNewsList : [NewsModel] = []
    
    // MARK:- API CAll
    public func getNewsList(successCompletion : @escaping (_ newsList : [NewsModel]) -> (),errorHandler : @escaping (_ erromessage : String) -> ()){

        Alamofire.request(URL(string: APIEndPoint.GetNews)!, method: .get,parameters: [RequestParamter.sources:"google-news",RequestParamter.apiKey:"cb9be5badbeb40c6b260b1a2a41b29ea"],encoding: URLEncoding.queryString).responseJSON { (response) in
            switch response.result{
                case .success(let value):
                    if let jsonResponse = value as? [String : AnyObject]{
                        if let articles = jsonResponse["articles"] as? [[String : Any]]{
                            self.arrNewsList  = Mapper<NewsModel>().mapArray(JSONArray: articles)
                            successCompletion(self.arrNewsList)
                        }
                        else{
                            errorHandler(ErrorMessage.ErrorFetchingNews)
                        }
                    }
                    else{
                        errorHandler(ErrorMessage.ErrorFetchingNews)
                    }
                    break
                case .failure(let error):
                    errorHandler(error.localizedDescription)
                    break
            }
        }
    }
}


