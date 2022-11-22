import ProjectDescription

/// Required name attribute
public let kNameOption: Template.Attribute = .required("name")
/// Optional organization.
public let kOrgOption: Template.Attribute = .optional(
    "org", default: "com.awesome"
)
/// Minimum iOS target version.
public let kMinTgtOption: Template.Attribute = .optional(
    "minTgt", default: "14.0"
)

/// Project path.
public let kProjectPath = "./GenerateDummy/"
/// Application path.
public let kAppPath = "\(kProjectPath)App/\(kNameOption)"

/// Template configuration.
public let kTemplate = Template(
    description: "TCA Project generation template",
    attributes: [
        kNameOption,
        kOrgOption,
        kMinTgtOption,
    ],
    items: [
        // Project root.
        .file(
            path: "\(kProjectPath)/Project.swift",
            templatePath: "Project.stencil"
        ),
        .file(
            path: "\(kProjectPath)/.swift-format",
            templatePath: ".swift-format"
        ),
        .file(
            path: "\(kProjectPath)/.swiftlint.yml",
            templatePath: ".swiftlint.yml"
        ),
        // Application root.
        .file(
            path: "\(kAppPath)/Sources/\(kNameOption).swift",
            templatePath: "./App/Sources/App.stencil"
        ),
        .file(
            path: "\(kAppPath)/Sources/Constants.swift",
            templatePath: "./App/Sources/Constants.stencil"
        ),
        // Common extensions and helpers.
        .directory(
            path: "\(kAppPath)/Sources/",
            sourcePath: "./App/Sources/Extensions/"
        ),
        .directory(
            path: "\(kAppPath)/Sources/",
            sourcePath: "./App/Sources/Helpers/"
        ),
        // Tests.
        .file(
            path: "\(kAppPath)/Tests/\(kNameOption)Tests.swift",
            templatePath: "./App/Tests/AppTests.stencil"
        ),
    ]
)
