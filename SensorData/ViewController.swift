//
//  ViewController.swift
//  SensorData
//
//  Created by Rob Lamprell on 14/10/2022.
//

import SwiftUI
//import UIKit

struct ViewController: View {
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.purple, .black, .black, .purple, .purple, .black, .purple]), center: .center)
            Text("").font(.system(size: 83)).fontWeight(.thin).foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
    }
}
//
//AngularGradient(gradient: Gradient(colors: [.green, .blue, .black, .green, .blue, .black, .green]), center: .center)

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}

//class ViewController: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//        <#code#>
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        <#code#>
//    }
//
////    typealias UIViewControllerType = UIViewController
    
    
    
//    override func viewDidLoad() {
//        //
//    }

//    override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
//
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.frame = view.bounds
//    gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
//    gradientLayer.startPoint = CGPoint(x: 0.0, y:0.0)
//    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//    view.layer.addSublayer(gradientLayer)
//    }
//}


//class ViewController: UIViewController {
//    override func viewDidLoad() {
//        //
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y:0.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        view.layer.addSublayer(gradientLayer)
//    }
//}
