//
//  ViewRouter.swift
//  NewLeaf
//
//  Created by Khandice Schuhmann on 2/10/22.
//

import Foundation
import SwiftUI


class ViewRouter: ObservableObject {
    // everytime the value to published var changes every observing view updates similar to @State var
    @Published var currentPage: Page = .page1
}
