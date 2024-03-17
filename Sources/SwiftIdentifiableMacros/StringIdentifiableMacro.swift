import SwiftSyntax
import SwiftSyntaxMacros

public enum StringIdentifiableMacro {}

extension StringIdentifiableMacro: ExtensionMacro {
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        let syntax: DeclSyntax = """
        extension \(type.trimmed): Identifiable {}
        """
        guard let extensionDecl = syntax.as(ExtensionDeclSyntax.self) else {
            return []
        }
        return [extensionDecl]
    }
}

extension StringIdentifiableMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard
            case .argumentList(let arguments) = node.arguments,
            arguments.count == 1,
            let memberAccessExn = arguments.first?
                .expression.as(MemberAccessExprSyntax.self),
            let rawType = memberAccessExn.base?.as(DeclReferenceExprSyntax.self)
        else {
            fatalError("compiler bug: the macro does not have any arguments")
        }
        return [ """
        \(declaration.modifiers)struct ID: StringIDProtocol {
            \(declaration.modifiers)let rawValue: \(rawType)
            \(declaration.modifiers)init(rawValue: \(rawType)) {
                self.rawValue = rawValue
            }
        }
        \(declaration.modifiers)var id: ID
        """
        ]
    }
}

