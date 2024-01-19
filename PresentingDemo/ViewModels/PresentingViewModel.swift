//
//  PresentingViewModelling.swift
//  PresentingDemo
//
//  Created by Giorgio Latour on 1/19/24.
//

import Foundation
import Presenting

protocol PresentingViewModel: AnyObject {
    associatedtype PresentableView: Presentable
    var presenter: Presenter<PresentableView>? { get set }
}
