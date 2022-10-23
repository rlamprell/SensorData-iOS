//
//  fileWriter.swift
//  SensorData
//
//  Created by Rob Lamprell on 15/10/2022.
//

import SwiftUI
import FileProviderUI


class FileWriter {
    
    func writeToFile(dataToSave: String) {
        let stringToSave = dataToSave
        let path = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)[0].appendingPathComponent("myFile")

        if let stringData = stringToSave.data(using: .utf8) {
            try? stringData.write(to: path)
        }
    }
}
