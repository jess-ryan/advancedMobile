//
//  dataLoader.swift
//  lab-5
//
//  Created by Jess Ryan on 2/28/22.
//

import Foundation

class TriviaDataHandler {
    var triviaData = TriviaData()
    
    func loadjson() async {
        
        guard let urlPath = URL(string: "https://opentdb.com/api.php?amount=10")
            else {
                print("url error")
                return
            }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: urlPath, delegate: nil)
            guard (response as? HTTPURLResponse)?.statusCode == 200
                else {
                    print("file download error")
                    return
                }
            //download successful
            print("download complete")
            parsejson(data)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func parsejson (_ data: Data) {
        do
        {
            let apiData = try JSONDecoder().decode(TriviaData.self, from: data)
            for t in apiData.trivias
            {
                triviaData.trivias.append(t)
                print(t)
            }
            print("number of jokes parsed \(triviaData.trivias.count)")
            print("parsejson done")
        }
        catch let jsonErr
        {
            print(jsonErr.localizedDescription)
            return
        }
    }

    func getTriva() -> [Trivia] {
        return triviaData.trivias
    }
}
