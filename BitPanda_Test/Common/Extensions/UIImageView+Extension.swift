//
//  UIImageView+Extension.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 23/10/21.
//

import UIKit.UIImageView

extension UIImageView {
    
    func asyncLoadImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
            if error != nil {
                #if DEBUG
                print(error as Any)
                #endif
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                return
            }
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.image = image
                    try? data.write(to: FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("imageCache/\(url)"))
                } else {
                    #if DEBUG
                    print("Image could not be downloaded.")
                    #endif
                }
            }
            
        }).resume()
    }
}
