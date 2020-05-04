
import Foundation

class Networking {
    
    let url:String = NetworkObjects.assesURL
    static let sharedInstance = Networking()
    
    func getInfo(completion: @escaping(MainInfo?,Error?)->Void) {
            guard let assUrl = URL(string: url) else {
                       return
                   }

                URLSession.shared.dataTask(with: assUrl){ (data, response, error) in
                  

                       if let error = error {
                         completion(nil, error)
                        print(error.localizedDescription)
                           return
                       }else{
                       
                        guard let data = data else {return}
                        let jsonString = String(decoding: data, as: UTF8.self)
                        do{
                          let infoResults = try JSONDecoder().decode(MainInfo.self, from: jsonString.data(using:.utf8)!)
                            completion(infoResults,nil)
                            
                        }
                        catch{
                            print(error.localizedDescription)
                            completion(nil,error)
                            
                        }
                    }
                }.resume()
                        }
                       
    
}
