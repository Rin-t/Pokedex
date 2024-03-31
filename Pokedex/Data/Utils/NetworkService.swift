//
//  NetworkService.swift
//  Pokedex
//
//  Created by Rin on 2024/03/31.
//

import Foundation

enum NetworkService {

    enum Error: Swift.Error {
        case decodeError
        case connectionError
        case unknown
    }

    static func fetchSingleData<Response: Decodable>(url: URL) async throws -> Response {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = try JSONDecoder().decode(Response.self, from: data)
            return decoder
        } catch let error as DecodingError {
            throw Error.decodeError
        } catch let error as URLError {
            throw Error.connectionError
        }
    }

    static func fetchDataList<Response: Decodable>(urls: [URL]) async throws -> [Response] {
        try await withThrowingTaskGroup(of: Response.self) { group in
            for url in urls {
                group.addTask {
                    return try await fetchSingleData(url: url)
                }
            }
            var responses: [Response] = []
            for try await data in group {
                responses.append(data)
            }
            return responses
        }
    }
}
