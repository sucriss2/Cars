//
//  underlinedButton.swift
//  Cars
//
//  Created by Suh on 28/11/22.
//

import UIKit

final class UnderlinedButton: UIButton {

    enum Style {
        case primary
        case secondary
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
        switch style {
        case .primary:
            color = .black
        case .secondary:
            color = .gray
        }

        let atributedString = NSAttributedString(
            string: title ?? "",
            attributes: [
                NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
                NSAttributedString.Key.foregroundColor : color
            ]
        )

        setAttributedTitle(atributedString, for: .normal)
    }
}
