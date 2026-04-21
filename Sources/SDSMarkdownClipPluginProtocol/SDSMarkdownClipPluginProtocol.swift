// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
//import SDSMarkdownEditView
import SwiftUI
import SDSMacros

@IsCheckEnum
@AssociatedValueEnum
public enum ModifyText {
    case insert(text: String, at: String.Index, newCursor: String.Index?)
    case replace(text: String, at: Range<String.Index>, newCursor: String.Index?)
    case remove(at: Range<String.Index>, newCursor: String.Index?)
    
    public var newCursor: String.Index? {
        switch self {
        case .insert(let text, let at, let newCursor):  return newCursor
        case .replace(let text, let at, let newCursor): return newCursor
        case .remove(let at, let newCursor):            return newCursor
        }
    }
}

public protocol MarkdownClipGeneralProtocol {
    init()
    var name: String { get }
}

public protocol MarkdownClipTextPlugin: MarkdownClipGeneralProtocol {
    func modifyText(text: String, at: String.Index)  -> ModifyText?
}

public protocol MarkdownClipGUIPlugin: MarkdownClipGeneralProtocol {
    @MainActor
    func sheet() -> AnyView
}

@objc
open class PluginBuilder: NSObject {
    public required override init() {}
    open func plugins() -> [MarkdownClipGeneralProtocol] {
        fatalError("need to be overrided.")
    }
}
