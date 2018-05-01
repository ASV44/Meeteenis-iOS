//
//  RequestExecutor.swift
//  Meetennis
//
//  Created by Hackintosh on 3/25/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import RxSwift
import Alamofire
import ObjectMapper

class RequestExecutor {
    
    func execute<T: Mappable>(to url: String, with parameters: Parameters!, method: HTTPMethod, headers: HTTPHeaders? = nil) -> Observable<T> {
        let request = getRequest(to: url, with: parameters, method: method, headers: headers)
        return execute(request).map {it in Mapper<T>().map(JSONObject: it)! }
    }
    
    func execute(to url: String, with parameters: Parameters!, method: HTTPMethod, headers: HTTPHeaders? = nil) -> Observable<Void> {
        let request = getRequest(to: url, with: parameters, method: method, headers: headers)
        return execute(request).map {_ in }
    }
    
    func execute<T>(_ request: Observable<T>) -> Observable<T> {
        if !Reachability.isConnectedToNetwork() {
            return Observable.error(NetworkConnectionException())
        }
        
        return request.catchError { error in
            return Observable.error(error as! HttpException)
        }
    }
    
    func getRequest(to url: String, with parameters: Parameters!, method: HTTPMethod, headers: HTTPHeaders? = nil) -> Observable<Any> {
        return Observable.create { observer in
            let request = Alamofire.request(url, method: method, parameters: parameters,encoding: JSONEncoding.default, headers: headers)
                .validate().responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                    case .failure(let error):
                        let httpException = (response.data?.isEmpty)!
                            ? HttpException(code: response.response?.statusCode,error: error)
                            : HttpException(data: response.data)
                        observer.onError(httpException)
                    }
            }
            request.resume()
            
            return Disposables.create(with: request.cancel)
        }
    }
}
