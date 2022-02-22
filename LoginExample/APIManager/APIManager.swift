//
//  APIManager.swift
//  LoginExample
//
//  Created by MacBook Air on 29/02/20.
//  Copyright © 2022 Ghiffary. All rights reserved.
//

import Foundation
import Alamofire


enum APIErrors: Error{
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void
typealias DashboardCallback = (_ Dashboard:[DashboardModel]?, _ status: Bool, _ message:String) -> Void
typealias SearchCallback = (_ Search:SearchModel?, _ status: Bool, _ message:String) -> Void



class APIManager {
    
    static let shareInstance = APIManager()
    var callBack: DashboardCallback?
    var callBackSearch:SearchCallback?
    var token: String = ""
    
    
    

    
    // MARK: Get all data dashboard
    
    func getAllDataObat (){
        
        let headers: HTTPHeaders = [
            .contentType("application/json; charset=UTF-8")
        ]
        
        AF.request(get_product_url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers, interceptor: nil, requestModifier: nil).response{
            responseData in
            debugPrint(responseData)
            
            guard let data = responseData.data else {
                self.callBack?(nil, false , "")
                
                return}
            
            
            do {
            let Dashboard = try JSONDecoder().decode([DashboardModel].self, from: data)
                print("data dashboard == \(Dashboard)")
                self.callBack?(Dashboard, true, "")
                
            }catch{
                print("error decoding == \(error)")
                self.callBack?(nil, false, error.localizedDescription)
            }
            
            
            
        }
    }
    

    
    
    func completionHandler (callBack: @escaping DashboardCallback){
        self.callBack = callBack
    }
    
    
    // MARK: AddProduct API call
    
    func callingAddProductAPI(AddProduct: AddProductModel, completionHandler: @escaping Handler
    ){
        let headers: HTTPHeaders = [
            .contentType("application/json; charset=UTF-8")
        ]
        
        AF.request(add_product_url, method: .post, parameters: AddProduct, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            
            switch response.result{
                case .success(let data):
                    do{
                        
                        let json = try JSONDecoder().decode(RespnseAddProduct.self, from: data!)
//                        print("uhuyy",json)
                        
//                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print("loveadd",json)
                        if response.response?.statusCode == 200{
                            completionHandler(.success(json))
                        }else{
                            completionHandler(.failure(.custom(message: "please check your network connectivity")))
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                        completionHandler(.failure(.custom(message: "please try again")))
                    }
                case .failure(let err): break
                    print(err.localizedDescription)
                    completionHandler(.failure(.custom(message: "please try again")))
                
            }
        }
        
    }
    
    
    // MARK: Search API call
    
    func callingSearchAPI(id : String?, completionHandler: @escaping Handler
    ){
        let headers: HTTPHeaders = [
            .contentType("application/json; charset=UTF-8")
        ]
        
        let UrlSearch = search_byId_url+id!
        
        AF.request(UrlSearch, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).response{ response in
            debugPrint(response)
            
            switch response.result{
                case .success(let data):
                    do{
                        
                        let json = try JSONDecoder().decode(SearchModel.self, from: data!)
                        print("uhuyy",(json as! SearchModel).title)
                        
//                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print("Search ==",json)
                        if response.response?.statusCode == 200{
                            completionHandler(.success(json))
                        }else{
                            completionHandler(.failure(.custom(message: "please check your network connectivity")))
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                        completionHandler(.failure(.custom(message: "please try again")))
                    }
                case .failure(let err): break
                    print(err.localizedDescription)
                    completionHandler(.failure(.custom(message: "please try again")))
                
            }
        }
        
    }
    
    
    
    // MARK: Delete API call
    
    func callingDeleteAPI(id : String?, delete: DeleteModel, completionHandler: @escaping Handler
    ){
        let headers: HTTPHeaders = [
            .contentType("application/json; charset=UTF-8")
        ]
        
        let DeleteUrl = delete_product_url+id!
        
        AF.request(DeleteUrl, method: .delete, parameters: delete, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            
            switch response.result{
                case .success(let data):
                    do{
                        
                        let json = try JSONDecoder().decode(ResponseDeleteModel.self, from: data!)
                        print("Delete",(json as! ResponseDeleteModel).title)
                        
//                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print("delete ==",json)
                        if response.response?.statusCode == 200{
                            completionHandler(.success(json))
                        }else{
                            completionHandler(.failure(.custom(message: "please check your network connectivity")))
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                        completionHandler(.failure(.custom(message: "please try again")))
                    }
                case .failure(let err): break
                    print(err.localizedDescription)
                    completionHandler(.failure(.custom(message: "please try again")))
                
            }
        }
        
    }
    
    
    // MARK: UpdateProduct API call
    
    func callingUpdateProductAPI(id : String?,UpdateProduct: UpdateProductModel, completionHandler: @escaping Handler
    ){
        let headers: HTTPHeaders = [
            .contentType("application/json; charset=UTF-8")
        ]
        
        let UrlUpdate = update_product_url+id!
        
        AF.request(UrlUpdate, method: .put, parameters: UpdateProduct, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            
            switch response.result{
                case .success(let data):
                    do{
                        
                        let json = try JSONDecoder().decode(ResponseUpdateModel.self, from: data!)
//                        print("uhuyy",json)
                        
//                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print("loveUpdate",json)
                        if response.response?.statusCode == 200{
                            completionHandler(.success(json))
                        }else{
                            completionHandler(.failure(.custom(message: "please check your network connectivity")))
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                        completionHandler(.failure(.custom(message: "please try again")))
                    }
                case .failure(let err): break
                    print(err.localizedDescription)
                    completionHandler(.failure(.custom(message: "please try again")))
                
            }
        }
        
    }

    
    
}
