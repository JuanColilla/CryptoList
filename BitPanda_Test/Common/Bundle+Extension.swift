//
//  Bundle+Extension.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        
        // 1. Locate JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            #if DEBUG
            fatalError("Failed to locate \(file) in bundle.")
            #endif
        }
        
        // 2. Create data property
        guard let data = try? Data(contentsOf: url) else {
            #if DEBUG
            fatalError("Failed to load \(file) from bundle.")
            #endif
        }
        
        // 3. Create decoder
        let decoder = JSONDecoder()
        
        // 4. Create decoded data property
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            #if DEBUG
            fatalError("Failed to decode \(file) from bundle.")
            #endif
        }
        
        // 5. Return ready to use data
        return loadedData
        
    }
    
}
