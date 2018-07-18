//
//  NewsDetailViewModel.swift
//  TechFlakeAssignment
//
//  Created by Jayesh on 18/07/18.
//  Copyright © 2018 Jayesh kanzariya. All rights reserved.
//

import UIKit

class NewsDetailViewModel: NSObject {

    var information : [String] = []
    var objNews : NewsModel!
    
    init(objNews : NewsModel) {
        self.objNews = objNews
        information.append(objNews.urlToImage!)
        if let author = objNews.author,!author.isEmpty{
            information.append("Author : \(author)")
        }
        if let title = objNews.title,!title.isEmpty{
            information.append("Title : \(title)")
        }
        if let description = objNews.description,!description.isEmpty{
            information.append("Description : \(description)")
        }
        if let publishedAt = objNews.publishedAt,!publishedAt.isEmpty{
            information.append("PublishedAt : \(publishedAt)")
        }
        if let link = objNews.url,!link.isEmpty{
            information.append("Link : \(link)")
        }
    }
    
}
