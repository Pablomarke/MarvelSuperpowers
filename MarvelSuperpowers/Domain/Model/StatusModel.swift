//
//  StatusModel.swift
//  MarvelSuperpowers
//
//  Created by Pablo Márquez Marín on 8/11/23.
//

import Foundation

enum Status {
    case none, loading, loaded, register, error(error: String)
}
