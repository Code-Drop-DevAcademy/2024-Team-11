//
//  RouterModel.swift
//  Code Drop_Team 11
//
//  Created by Hyun Lee on 6/15/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject{
    @Published var path: NavigationPath = NavigationPath()
    
    func push(_ routePathView: Destination){
        path.append(routePathView)
    }
    
    func backToRoot(){
        self.path = NavigationPath()
    }
}

enum Destination{
    case homeView
    case listView
    case detailView
    case endView
}

