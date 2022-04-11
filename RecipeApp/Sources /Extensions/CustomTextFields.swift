//
//  CustomTextFields.swift
//  RecipeApp
//
//  Created by Алсу Хайруллина on 07.04.2022.
//

import UIKit

open class customUITextField: UITextField {

    func setup() {
        self.backgroundColor = .none
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.customGray.cgColor
        self.layer.cornerRadius = 20
    }
    
    var textPadding = UIEdgeInsets(
            top: 10,
            left: 20,
            bottom: 10,
            right: 20
        )
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.textRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

      open override func editingRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.editingRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}
