//
//  TestView2.swift
//  SensorData
//
//  Created by Rob Lamprell on 18/10/2022.
//

import SwiftUI

struct TestView2: View {
    let x = stacker()
    var body: some View {
//        Text("view 2")
        Text(x.vStacker())
        
    }
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
