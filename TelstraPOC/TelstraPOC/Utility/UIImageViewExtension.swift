

import Foundation
import UIKit

extension UIImageView {
    
    func imagedownlaodedFromURL(_ URLString: String, placeHolder: UIImage?) {
        
        let imageCache = NSCache<NSString, UIImage>()
        
        self.image = #imageLiteral(resourceName: "placeholder")
        let imageUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let cachedImage = imageCache.object(forKey: NSString(string: imageUrl)) {
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: imageUrl))
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
}
