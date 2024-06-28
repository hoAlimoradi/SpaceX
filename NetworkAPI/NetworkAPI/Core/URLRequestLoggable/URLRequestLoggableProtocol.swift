//
//  URLRequestLoggableProtocol.swift
//  NetworkAPI
//
//  Created by ho on 4/8/1403 AP.
//
import Foundation
import LoggingAPI

/// A protocol for logging URLRequest responses.
protocol URLRequestLoggableProtocol {
   /// Logs the response of a URL request.
   ///
   /// - Parameters:
   ///   - response: The HTTP response received from the request.
   ///   - data: The data received from the request.
   ///   - error: The error received from the request, if any.
   ///   - HTTPMethod: The HTTP method of the request.
   func logResponse(_ response: HTTPURLResponse?, data: Data?, error: Error?, HTTPMethod: String?)
}
