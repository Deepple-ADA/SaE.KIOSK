//
//  File.swift
//  hackerton
//
//  Created by Greed on 2023/08/25.
//

import Foundation

protocol Menuable : Identifiable {
    var description: MenuModel.Menu { get }
}
