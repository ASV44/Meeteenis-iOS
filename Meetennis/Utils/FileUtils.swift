//
//  FileUtils.swift
//  Meetennis
//
//  Created by Hackintosh on 2/6/18.
//  Copyright © 2018 Hackintosh. All rights reserved.
//

import UIKit

class FileUtils {
    static func getFileUrl(_ name: String,
                           in directory: FileManager.SearchPathDirectory,
                           with domainMask: FileManager.SearchPathDomainMask) -> URL {
        
        let documentsDirectoryPathString = NSSearchPathForDirectoriesInDomains(directory, domainMask, true).first!
        let documentsDirectoryPath = URL(fileURLWithPath: documentsDirectoryPathString)
        let filePath = documentsDirectoryPath.appendingPathComponent(name)
        
        return filePath
    }
}
