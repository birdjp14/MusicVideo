//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Jonathan Ky on 3/4/16.
//  Copyright © 2016 Jonathan Ky. All rights reserved.
//

import Foundation

class Videos {
    
    // Data Encapsulation
    
    private var _vName: String
    private var _vImageUrl: String
    private var _vVideoUrl : String
    private var _vRights: String
    private var _vPrices: String
    private var _vArtist: String
    private var _vImid: String
    private var _vGenre: String
    private var _vLinkToiTunes: String
    private var _vReleaseDte: String
    
    // This variable gets create from the UI
    var vImageData: NSData?
    
    // Make a getter
    
    var vName: String {
        return _vName
    }
    
    var  vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl: String {
        return _vVideoUrl
    }
    
    var vRights: String {
        return _vRights
    }
    
    var vPrices: String {
        return _vPrices
    }
    
    var vArtist: String {
        return _vArtist
    }
    var vImid: String {
        return _vImid
    }
    var vGenre: String {
        return _vGenre
    }
    var vLinkToiTunes: String {
        return _vLinkToiTunes
    }
    var vReleaseDte: String {
        return _vReleaseDte
    }
    
    init(data: JSONDictionary) {
        
        // If we do not initialize all properties we will get error message
        // Return from initializer without initializing all stored properties
        
        // Video name
        
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
            self._vName = vName
        }
        else
        {
            // You may not alway get data back from the JSON - you may want to display message
            // element in the JSON is unexpected
            
            _vName = ""
        }
        
        // The video Image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else
        {
            _vImageUrl = ""
        }
        
        // Video Url
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            _vVideoUrl = vHref["href"] as? String {
            self._vVideoUrl = _vVideoUrl
        }
        else
        {
            _vVideoUrl = ""
        }
        // Studio Name
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String {
            self._vRights = vRights
        }
        else
        {
            _vRights = ""
        }
        // Video Prices
        if let price = data["im:price"] as? JSONDictionary,
            prices = price["label"] as? String {
            self._vPrices = prices
        }
        else
        {
            _vPrices = ""
        }
        
        // Video Artist Name
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtists = artist["label"] as? String {
            self._vArtist = vArtists
        }
        else
        {
            _vArtist = ""
        }
        // Artist ID for iTune Search API
        if let imid = data["id"] as? JSONDictionary,
            vid = imid["attrubutes"] as? JSONDictionary,
            vImid = vid["im:id"] as? String {
            self._vImid = vImid
        }
        else
        {
            _vImid = ""
        }
        // Video Genre
        if let gen = data["category"] as? JSONDictionary,
            rel2 = gen["attributes"] as? JSONDictionary,
            vGenre = rel2["term"] as? String {
            self._vGenre = vGenre
        }
        else
        {
            _vGenre = ""
        }
        // Video link to iTune
        if let release2 = data["id"] as? JSONDictionary,
            vLinkToiTunes = release2["label"] as? String {
            self._vLinkToiTunes = vLinkToiTunes
        }
        else
        {
            _vLinkToiTunes = ""
        }
        // Video Release Date
        if let release3 = data["im:releaseDate"] as? JSONDictionary,
            rel3 = release3["attributes"] as? JSONDictionary,
            vReleaseDte = rel3["label"] as? String {
            self._vReleaseDte = vReleaseDte
        }
        else
        {
            _vReleaseDte = ""
        }
    }

}
