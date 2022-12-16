//
//  PhotoImageView.swift
//  Cars
//
//  Created by Suh on 02/12/22.
//

import UIKit

final class PhotoImageView: UIView {

    let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let named: String

    init(named: String) {
        self.named = named
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
