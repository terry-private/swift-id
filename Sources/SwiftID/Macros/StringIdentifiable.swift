@attached(member, names: named(ID), named(id))
@attached(extension, conformances: Identifiable)
public macro StringIdentifiable<T: StringProtocol>(_: T.Type) = #externalMacro(module: "SwiftIdentifiableMacros", type: "StringIdentifiableMacro")

