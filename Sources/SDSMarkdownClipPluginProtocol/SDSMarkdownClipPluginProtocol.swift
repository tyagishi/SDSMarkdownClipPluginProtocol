// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SDSMarkdownEditView
import SwiftUI

public protocol MarkdownClipGeneralProtocol {
    init()
    var name: String { get }
}

public protocol MarkdownClipTextPlugin: MarkdownClipGeneralProtocol {
    func editText(text: String, at: String.Index) -> (newText: String, replace: Range<String.Index>, cursorAt: String.Index?)
}

public protocol MarkdownClipGUIPlugin: MarkdownClipGeneralProtocol {
    var textViewModel: MarkdownTextViewModel? { get set }

    @MainActor
    @ViewBuilder
    func sheet() -> AnyView
}

@objc
open class PluginBuilder: NSObject {
    public required override init() {}
    open func plugins() -> [MarkdownClipGeneralProtocol] {
        fatalError("need to be overrided.")
    }
}
