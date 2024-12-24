//
//  CircularControlLabelFormat.swift
//  PZCircularControl
//
//  Created by Phil Zakharchenko on 12/24/24.
//

import Foundation

public enum CircularControlLabelFormat {
    case percentage
    case fraction
    case custom((Double) -> String)
    
    func string(from value: Double) -> String {
        switch self {
        case .percentage:
            return "\(Int(value * 100))%"
        case .fraction:
            return String(format: "%.1f", value)
        case .custom(let formatter):
            return formatter(value)
        }
    }
    }
