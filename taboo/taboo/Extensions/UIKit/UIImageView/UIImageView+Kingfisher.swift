//
//  UIImageView+Kingfisher.swift
//  taboo
//
//  Created by Alisher Sattarbek on 4/15/21.
//

import Kingfisher
import Moya

extension UIImageView {
    func setImage(fileName: String) {
        let path = AppConstants.API.Image.getImage(fileName: fileName)
        let url = AppConstants.API.appUrl.appendingPathComponent(path)
        let modifier = AnyModifier { request in
            var r = request
            let token = "Bearer \(AuthenticationStore.shared.getAccessToken() ?? "")"
            r.setValue(token, forHTTPHeaderField: "Authorization")
            return r
        }
        kf.indicatorType = .activity
        kf.setImage(with: url,
                    placeholder: nil,
                    options: [.requestModifier(modifier),
                              .transition(.fade(0.5))
        ])
    }
}
