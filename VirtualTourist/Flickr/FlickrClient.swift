//
//  FlickrClient.swift
//  VirtualTourist
//
//  Created by Sarah Rebecca Estrellado on 5/28/19.
//  Copyright © 2019 Sarah Rebecca Estrellado. All rights reserved.
//

import Foundation

class FlickrClient {
    
    static var shared = FlickrClient()
    
    func taskForGetPhotos(latitude: Double, longitude: Double, page: Int, completion: @escaping (_ result: FlickrPhotos?, _ error: NSError?) -> Void) -> URLSessionDataTask? {
        
        let parameters: [String: Any] = [FlickrConstants.ParameterKeys.APIKey : FlickrConstants.API.APIKey,
                                         FlickrConstants.ParameterKeys.Method : FlickrConstants.ParameterValues.PhotosSearch,
                                         FlickrConstants.ParameterKeys.Format : FlickrConstants.ParameterValues.Json,
                                         FlickrConstants.ParameterKeys.NoJsonCallback : FlickrConstants.ParameterValues.NoJsonCallback,
                                         FlickrConstants.ParameterKeys.Page : page,
                                         FlickrConstants.ParameterKeys.PerPage : FlickrConstants.ParameterValues.PerPage,
                                         FlickrConstants.ParameterKeys.Latitude : latitude,
                                         FlickrConstants.ParameterKeys.Longitude : longitude]
        
        var components = URLComponents()
        components.scheme = FlickrConstants.API.APIScheme
        components.host = FlickrConstants.API.APIHost
        components.path = FlickrConstants.API.APIPath
        components.queryItems = parameters.map {
            URLQueryItem(name: $0.key, value: String(describing: $0.value))
        }
        
        let request = URLRequest(url: components.url!)
        
        print(request.url!)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                self.sendError("Something went wrong, please try again", "taskForGetPhotos", completion)
                return
            }
            
            guard let httpStatusCode = (response as? HTTPURLResponse)?.statusCode else {
                self.sendError("Something went wrong, please try again", "taskForGetPhotos", completion)
                return
            }
            
            if httpStatusCode >= 200 && httpStatusCode < 300 {
                struct Result : Codable {
                    let photos: FlickrPhotos
                }
                let decoder = JSONDecoder()
                let result = try! decoder.decode(Result.self, from: data!)
                completion(result.photos, nil)
            }
            else{
                self.sendErrorForHttpStatusCode(httpStatusCode, "taskForGetPhotos", completion)
            }
        }
        
        return task
    }
}

    
    

