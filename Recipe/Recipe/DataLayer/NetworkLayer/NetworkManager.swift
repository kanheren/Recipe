//
//  NetworkManager.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

class NetworkManager {
    func sendRequest(httpRequest: HttpRequest, strategyCallback: @escaping (NetworkOutcome) -> Void) {
        
        let data = Data()
        let tempError = HttpResponse(data: data, httpURLResponse: nil, timeOfResponse: nil)
        var outcome = NetworkOutcome.Error(tempError)
        
        guard let uri = httpRequest.uri, !uri.isEmpty, let url = URL(string: uri) else { return }
        
        // proceed with network call
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: TimeInterval(httpRequest.timeout))
        URLCache.shared.removeAllCachedResponses()
        
        switch httpRequest.method {
        case .unknown:
            request.httpMethod = "GET"
        case .delete:
            request.httpMethod = "DELETE"
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
        case .put:
            request.httpMethod = "PUT"
        }
        
        // set headers
        let swiftDict = httpRequest.headers
        request.allHTTPHeaderFields = swiftDict
        
        if let body = httpRequest.body, !body.isEmpty {
            if let requestData = body.data(using: String.Encoding.utf8) {
                request.httpBody = requestData
            }
        }
        
        // if a body is specified in Data form, it takes precendence over the `body` variant which is in string form.
        if let dataBody = httpRequest.dataBody {
            request.httpBody = dataBody
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            let timeOfResponse = Date()
            
            if data != nil { // swiftlint:disable:next force_cast
                let httpURLResponse: HTTPURLResponse? = response as! HTTPURLResponse?
                let httpResponse = HttpResponse(data: data!, httpURLResponse: httpURLResponse!, timeOfResponse: timeOfResponse)
                
                if error != nil {
                    print("Error")
                } else {
                    if let statusCode = httpURLResponse?.statusCode {
                        switch statusCode {
                            // Request successfully accepted/received/understood by the server
                        case 100, 101, 200, 201, 202, 203, 204, 205, 206:
                            outcome = .Success(httpResponse)
                        case 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417:
                            print("Error")
                            // Server Unavailable or Internal Server Error or any other Server error
                        case 500, 501, 502, 503, 504, 505:
                            outcome = .Error(httpResponse)
                            print("Error")
                            // Error type is not known
                        default:
                            print("Error")
                        }
                    }
                }
                self.printRequestAndResponse(request: httpRequest, response: httpResponse)
            } else {
                // return empty HTTPURLResponse object
                print("Error")
            }
            
            strategyCallback(outcome)
        })
        
        dataTask.resume()
        httpRequest.timeOfRequest = Date()
    }
    
    func printRequestAndResponse(request: HttpRequest, response: HttpResponse) {
        var printString = String()
        
        var titleString = "**** HTTP REQUEST / RESPONSE for --UNKNOWN SERVICE-- ****"
        
        if let serviceName = request.serviceName {
            titleString = titleString.replacingOccurrences(of: "--UNKNOWN SERVICE--", with: serviceName)
        }
        
        var asteriskString = ""
        for _ in 0 ..< (titleString.count - 1) {
            asteriskString += "*"
        }
        
        printString.append("/\(asteriskString)\n")
        printString.append("\(titleString)\n")
        printString.append("\(asteriskString)/\n")
        
        printString.append("Elapsed Time: ")
        
        var elapsedTimeString = String()
        if let timeOfRequest = request.timeOfRequest, let timeOfResponse = response.timeOfResponse {
            let elapsedTime = timeOfResponse.timeIntervalSince(timeOfRequest)
            elapsedTimeString = String(format: "%.5f seconds", elapsedTime)
        } else {
            elapsedTimeString = "---UNKNOWN---"
        }
        printString.append("\(elapsedTimeString)")
        printString.append("\n")
        
        printString.append("*************\n** REQUEST **\n*************\n")
        var printRequest = ""
        if let data = try? JSONSerialization.data(withJSONObject: request.dictionaryRepresentation(), options: []), let prettyRequest = data.prettyPrintedJSONString {
            printRequest = prettyRequest
        } else {
            printRequest = request.description
        }
        printString.append("\(printRequest)")
        printString.append("\n")
        
        printString.append("*******************\n** RESPONSE: \(String(describing: response.httpURLResponse!.statusCode)) **\n*******************\n")
        
        var printResponse = ""
        if let data = response.data, let prettyResponse = data.prettyPrintedJSONString {
            printResponse = prettyResponse
        } else {
            printResponse = "---NO DATA RETURNED---"
        }
        
        printString.append(printResponse)
        printString.append("\n")
        
        print("\n" + printString)
    }
}
