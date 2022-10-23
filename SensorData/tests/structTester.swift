//
//  structTester.swift
//  SensorData
//
//  Created by Rob Lamprell on 20/10/2022.
//

import Foundation


struct stacker {
    func vStacker()->String {
        let x = """
                VStack { Text("hi")}
                """
        print(type(of: x))
        return x
    }
}
