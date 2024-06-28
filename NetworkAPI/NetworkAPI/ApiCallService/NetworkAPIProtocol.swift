//
//  NetworkAPIProtocol.swift
//  NetworkAPI
//
//  Created by ho on 4/8/1403 AP.
//
import Foundation
import Combine
import DataModelAPI
import LoggingAPI
import CommonAPI

public protocol NetworkAPIProtocol {
    
    //MARK: get Launch
    func getLaunchItems() async throws -> [LaunchItemModel]
}
