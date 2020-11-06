//
//  APIProvider.swift
//  MVVMCoordinatorStructure
//
//  Created by thanh tien on 9/15/20.
//  Copyright © 2020 thanh tien. All rights reserved.
//

import Foundation
import Moya

enum APIRouter {
    case getListABC
}

extension APIRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIURL.baseURL)!
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return JSONHelper.dataFromFile(path: "Networking/SampleData/PopularMoviesSample") ?? Data()
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [
            HTTPHeaderField.contentType.rawValue: ContentType.json.rawValue
        ]
    }
    
    var path: String {
        switch self {
        default:
            return ""
        }
    }
}
