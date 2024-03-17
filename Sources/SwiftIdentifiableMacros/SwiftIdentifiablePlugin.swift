import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct SwiftIdentifiablePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        IntegerIdentifiableMacro.self,
        StringIdentifiableMacro.self
    ]
}
