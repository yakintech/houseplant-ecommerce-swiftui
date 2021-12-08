//
//  TokenRepository.swift
//  houseplantecommerce
//
//  Created by Çağatay Yıldız on 5.12.2021.
//

import Foundation



func getTokenWithRefreshToken(completionHandler: @escaping (TokenModel) -> Void ){
    
    
    guard let url = URL(string: Config.apiURL + "/refreshToken") else {return}
    
    var request = URLRequest(url:url)
    request.httpMethod = "POST"
    
    let postString = "email=cagatay@gmail.com&refreshToken=\(LoginHelper.refreshToken)"
    
    request.httpBody = postString.data(using: .utf8)
    
    
    
    URLSession.shared.dataTask(with: request){(data, response, error) in
       
        
        if let httpResponse = response as? HTTPURLResponse {
                
            do{
                

                if httpResponse.statusCode == 200{
                    
                    if let returnData = data{
                        
                        var tokenModel = try JSONDecoder().decode(TokenModel.self, from: returnData)
                        tokenModel.status = true
                    
                        
                        LoginHelper.refreshToken = tokenModel.refreshToken
                        LoginHelper.token = tokenModel.accessToken
                        
                        completionHandler(tokenModel)
                    }
                    
                }
                

            }
            catch{
                    
                print(error)
            }
            
            }
        
    }.resume()

}


struct TokenModel : Codable{
    var accessToken : String = ""
    var refreshToken : String = ""
    var status : Bool = false
}
