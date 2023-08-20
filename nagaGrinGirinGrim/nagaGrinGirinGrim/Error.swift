//
//  Error.swift
//  nagaGrinGirinGrim
//
//  Created by Jack Lee on 2023/08/20.
//

import UIKit

class ErrorHandler: UIViewController {
    
    enum Errors {
        case blank
        case needtoReload
    }
    
    func displayError(for errorType: Errors) {
        let alert: UIAlertController
        
        switch errorType {
        case .blank:
            alert = UIAlertController(title: "비었습니다", message: "내용을 채워주세요", preferredStyle: .alert)
        case .needtoReload:
            alert = UIAlertController(title: "재시도", message: "다시 한번 로드해주세요", preferredStyle: .alert)
        }
        
        let dismissAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(dismissAction)
        present(alert, animated: true)
    }
}
