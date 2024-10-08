//
//  ServiceController.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import Foundation

class ServiceController {
    //ToDo Nand, need to use object mapper
    
    func retrieveJSONRequestTemplate(name: String) -> String {
        var fileString = ""
        
        let bundle = Bundle.main
        
        if let filePath = bundle.path(forResource: name, ofType: "json") {
            do {
                fileString = try String(contentsOfFile: filePath, encoding: .utf8)
            } catch {}
        }
        
        return fileString
    }
    
    func encodeRequestBody<T: Encodable>(requestObject: T) -> Data? {
        do {
            let jsonEncoder = JSONEncoder()
            return try jsonEncoder.encode(requestObject)
        } catch {
            print("Error encoding request")
            return nil
        }
    }

    func decode<T>(_: T.Type,
                   fromOutcome outcome: NetworkOutcome,
                   completion: @escaping (_ response: ServiceOutcome<T>) -> Void) where T: Decodable {
        switch outcome {
        case .Success(_):
            do {
                let response = try outcome.get()
                
                // a response without data is treated as malformed
                guard let data = response.data else { return }
                
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.Success(decodedResponse))
            } catch {
                completion(.Error (getGenricError()) )
            }
        case let .Error(error):
            do {
                print("Request fail error")
                
                let decodedResponse = try JSONDecoder().decode(Errors.Response.self, from: error.data!)
                
                // Send error message back
                var errorMassage = ErrorResponseBaseClass()
                errorMassage.error = decodedResponse.error
                errorMassage.message = decodedResponse.message
                errorMassage.status = decodedResponse.status
                completion(.Error(errorMassage))

            } catch {
                completion(.Error (getGenricError()) )
            }
        }
        
        
    }
    private func getGenricError() -> ErrorResponseBaseClass {
        print("Network request fail error")
        var errorMassage = ErrorResponseBaseClass()
        errorMassage.error = "Error"
        errorMassage.message = "Authentication failed, please try again later."
        errorMassage.status = 502
        return errorMassage
    }
    func getServerURL() -> String {
        // Fetch values from user default
        let userDefaults = UserDefaults.standard
        var tempServerURL = userDefaults.string(forKey: "serverURL") ?? ""
        tempServerURL.until("/Asset")
        
        return tempServerURL
    }
}
