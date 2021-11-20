//
//  UserRepository.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 7.11.2021.
//

import Foundation




class UserRepository {
    
    
    
    func loginCheck(loginModel: LoginModel, completionHandler: @escaping (ResponseModel) -> Void ){
        
        
        guard let url = URL(string: Config.apiURL + "/api/user/logincontrol") else {return}
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        
        let postString = "email=\(loginModel.email.lowercased())&password=\(loginModel.password)"
        
        request.httpBody = postString.data(using: .utf8)
        
        
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
           
            
            if let httpResponse = response as? HTTPURLResponse {
                    
                do{
                    
                    if httpResponse.statusCode == 404{
                        
                        if let returnData = data{
                            
                            let errorModel = try JSONDecoder().decode(ErrorModel.self, from: returnData)
                            
                            var responseModel = ResponseModel()
                            responseModel.statusCode = httpResponse.statusCode
                            responseModel.responseData = ""
                            responseModel.error = errorModel.message
                            
                        
                            completionHandler(responseModel)
                        }
                        
                    }
                    if httpResponse.statusCode == 200{
                        
                        if let returnData = data{
                            
                            let userModel = try JSONDecoder().decode(UserModel.self, from: returnData)
                            
                            var responseModel = ResponseModel()
                            responseModel.statusCode = httpResponse.statusCode
                            responseModel.responseData = userModel
                            responseModel.error = ""
                            
                        
                            completionHandler(responseModel)
                        }
                        
                    }
                    

                }
                catch{
                        
                    print(error)
                }
                
                }
            
        }.resume()
    
        
        
        
    }
    
    func registerUser(usermodel:RegisterModel, completionHandler: @escaping (ResponseModel) -> Void){
        guard let url = URL(string: Config.apiURL + "/api/user") else {return}
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        
        let postString = "name=\(usermodel.name)&surname=\(usermodel.surname)&email=\(usermodel.email)&password=\(usermodel.password)"
        
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
           
            
            if let httpResponse = response as? HTTPURLResponse {
                    
                do{
                    
                    if httpResponse.statusCode == 403{
                        
                        if let returnData = data{
                            
                            let errorModel = try JSONDecoder().decode(ErrorModel.self, from: returnData)
                            
                            var responseModel = ResponseModel()
                            responseModel.statusCode = httpResponse.statusCode
                            responseModel.responseData = ""
                            responseModel.error = errorModel.message
                            
                        
                            completionHandler(responseModel)
                        }
                        
                    }
                    if httpResponse.statusCode == 201 {
                        
                        if let returnData = data{
                            
                            let newUser = try JSONDecoder().decode(UserModel.self, from: returnData)
                        
                            var responseModel = ResponseModel()
                            responseModel.statusCode = httpResponse.statusCode
                            responseModel.error = ""
                            responseModel.responseData = newUser
                            
                            completionHandler(responseModel)
                        }
                        
                    }
                    

                }
                catch{
                        
                    print(error)
                }
                
                }
            
        }.resume()
        
    }
    
}


//
//URLSession.shared.dataTask(with: request){ (data,response,error) in
//
//    do{
//
//        if let returnData = data{
//            let decodeData = try JSONDecoder().decode(CategoryModel.self, from: returnData)
//
//            completionHandler(decodeData)
//
//
//        }
//
//    }
//    catch{
//        print("Error!")
//    }
//
//}.resume()

//Bu email adresi kayıtlı, sistemde bir hata meydana geldi
//Önyüz validation hataları

//class UserRepository : ObservableObject{
//
//    @Published var users = [UserModel]()
//
//    func getAll() -> [UserModel]{
//
//        guard let url = URL(string: Config.apiURL + "/api/user") else {return [UserModel]()}
//
//        URLSession.shared.dataTask(with: url) {(data, response, error) in
//
//            do{
//
//                if let users = data {
//                    let decodeData = try JSONDecoder().decode([UserModel].self, from: users)
//
//                    self.users = decodeData
//                }
//
//            }
//            catch{
//                print("Error")
//            }
//
//
//        }
//
//        return [UserModel]()
//
//    }
//
//
//}
