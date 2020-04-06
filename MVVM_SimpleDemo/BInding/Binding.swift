//
//  Binding.swift
//  MVVM_SimpleDemo
//
//  Created by Sakir Saiyed on 07/04/20.
//  Copyright © 2020 Sakir Saiyed. All rights reserved.
//

import Foundation

class Observable<T> {
    var bind: (T) -> () = {_ in}
    
    var value: T {
        didSet {
            bind(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
}
