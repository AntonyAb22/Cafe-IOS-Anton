//
//  MultipartRequestPartFile.swift
//  Cafe-iOS-Anton
//
//  Created by Антон Абалуев on 27.12.2025.
//

import Foundation

struct MultipartRequestPartFile {
    let fileName: String?
    let mimeType: MimeType?
    let fileData: Data
    let name: String
    
    var partData: Data {
        var headerString = "Content-Disposition: form-data; name=\"\(name)\""
        if let fileName = fileName { headerString += "; filename=\"\(fileName)\"" }
        headerString += "\r\n"
        if let mimeType = mimeType {
            headerString += "Content-Type: \(mimeType.rawValue)\r\n"
        }
        headerString += "\r\n"

        let data = NSMutableData()
        data.appendString(headerString)
        data.append(fileData)
        data.appendString("\r\n")
        return data as Data
    }
    
    init(fileName: String?, mimeType: MimeType?, fileData: Data, name: String) {
        self.fileName = fileName
        self.mimeType = mimeType
        self.fileData = fileData
        self.name = name
    }
}
