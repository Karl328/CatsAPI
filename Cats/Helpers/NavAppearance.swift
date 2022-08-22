//
//  NavAppearance.swift
//  Cats
//
//  Created by Линар Нигматзянов on 22/08/2022.
//

import UIKit

public func setupAppearanceNavigationBar(with controller: UINavigationController) {

        let navigationBarAppearance = UINavigationBarAppearance()

        navigationBarAppearance.backgroundColor = UIColor.white

        let paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.lineHeightMultiple = 1.01

        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]

        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black,

                                                            .paragraphStyle: paragraphStyle,

                                                            .kern: 0.41]

        UINavigationBar.appearance().tintColor = UIColor.purple

        controller.navigationBar.standardAppearance = navigationBarAppearance

        controller.navigationBar.compactAppearance = navigationBarAppearance

        controller.navigationBar.scrollEdgeAppearance = navigationBarAppearance

        controller.navigationBar.setBackgroundImage(UIImage(), for: .default)

        controller.navigationBar.shadowImage = UIImage()

    }
