//
//  FontStyles.swift
//  DoughRiseChallenge
//
//  Created by Andres Pulgarin on 6/28/23.
//

import Foundation
import SwiftUI

extension Font {
    //MARK: General Fonts
    static var budgetTitle: Font {
        return Font.custom("Avenir Next Demi Bold", size: 18)
    }
    static var navTitle: Font {
        return Font.custom("Avenir Next Demi Bold", size: 11)
    }
    //MARK: Budget Font & Sizes
    static var monthTitle: Font {
        return Font.custom("Avenir Next Demi Bold", size: 13)
    }
    
    static var spentSubTitle: Font {
        return Font.custom("Avenir Next Demi Bold", size: 16)
    }
    
    static var spentValue: Font {
        return Font.custom("Avenir Next Demi Bold", size: 21)
    }
    
    static var availableValue: Font {
        return Font.custom("Avenir Next Demi Bold", size: 26)
    }
    
    //MARK: Category Font & Sizes
    static var categoryTitle: Font {
        return Font.custom("Avenir Next Demi Bold", size: 16)
    }
    
    static var categorySubTitle: Font {
        return Font.custom("Avenir Next Demi Bold", size: 15)
    }
    
    static var categoryValue: Font {
        return Font.custom("Avenir Next Demi Bold", size: 21)
    }
    
    static var categoryLeft: Font {
        return Font.custom("Avenir Next", size: 13)
    }
    //MARK: Snapshot & Savings Font & Sizes
    static var savedValue: Font {
        return Font.custom("Avenir Next Demi Bold", size: 26)
    }
    
    static var savedSubTitle: Font {
        return Font.custom("Avenir Next Demi Bold", size: 16)
    }
    
    static var totalSavedText: Font {
        return Font.custom("Avenir Next Demi Bold", size: 13)
    }
}

