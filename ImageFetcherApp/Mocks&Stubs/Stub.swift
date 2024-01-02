//
//  Stub.swift
//  ImageFetcherApp
//
//  Created by Naman Vaishnav on 02/01/24.
//

import Foundation
import imgurUtil

#if DEBUG


public struct ImageInfoasd:Decodable{
    public let type:String?
    public let link:String?
}


extension Gallery {
    
    
    static var stubs: [Gallery]{
        [
            Gallery(
                id: "E7FhX3f",
                title: "Test Image",
                dateTime: 1704145653,
                imageCount: 2,
                images: [
                            ImageInfo(type: "image/jpeg", link: "https://i.imgur.com/ihJMFd2.jpg"),
                            ImageInfo(type: "image/jpeg", link: "https://i.imgur.com/QxJPGwt.jpg")
                        ]
            ),
            
            Gallery(
                id: "E7FhX3f",
                title: "Test Image",
                dateTime: 1704145653,
                imageCount: 2,
                images: [
                            ImageInfo(type: "image/jpeg", link: "https://i.imgur.com/ihJMFd2.jpg"),
                            ImageInfo(type: "image/jpeg", link: "https://i.imgur.com/QxJPGwt.jpg")
                        ]
            ),
            
            Gallery(
                id: "E7FhX3f",
                title: "Test Image",
                dateTime: 1704145653,
                imageCount: 2,
                images: [
                            ImageInfo(type: "image/jpeg", link: "https://i.imgur.com/ihJMFd2.jpg"),
                            ImageInfo(type: "image/jpeg", link: "https://i.imgur.com/QxJPGwt.jpg")
                        ]
            )
        ]
    }
        
    
}

#endif
