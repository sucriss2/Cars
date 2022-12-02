//
//  BoldButton.swift
//  Cars
//
//  Created by Suh on 02/12/22.
//

import UIKit

final class BoldButton: UIButton {

    enum Style {
        case login
        case video
    }

    private let style: Style

    init(style: Style) {
        self.style = style
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setTitle(_ title: String?, for state: UIControl.State) {
        setupTitle(title: title)
        
    }

    private func setupTitle(title: String?) {

        let color: UIColor
        let backgroundColor: UIColor

        switch style {
        case .login:
            color = .white
            backgroundColor = .black
        case .video:
            color = .red
            backgroundColor = .black
        }

        let atributedString = NSAttributedString(
            string: title ?? "",
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18),
                NSAttributedString.Key.foregroundColor : color,
                NSAttributedString.Key.backgroundColor : backgroundColor
            ]
        )

        setAttributedTitle(atributedString, for: .normal)
    }

}
