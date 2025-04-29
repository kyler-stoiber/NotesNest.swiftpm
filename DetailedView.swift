//
//  Detailed.swift
//  Assignment Notebook Stoiber
//
//  Created by Stoiber, Kyler (512144) on 1/27/25.
//

import SwiftUI

struct DetailedView: View {
    
    let selectedFolder: Folder
    
    var body: some View {
        Text("Subject: \(selectedFolder.subject)")
        Text("Color: \(selectedFolder.color)")
        Text("Description: \(selectedFolder.desc)")

    }
}

