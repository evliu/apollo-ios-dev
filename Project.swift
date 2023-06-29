import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project(
    name: "ApolloDevTuist",
    organizationName: "apollographql",
    packages: [
        .package(path: "./apollo-ios"),
        .package(path: "./apollo-ios-codegen"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "10.0.0")
    ],
    settings: Settings.settings(configurations: [
        .debug(name: .debug, xcconfig: "Configuration/Apollo/Apollo-Project-Debug.xcconfig"),
        .release(name: .release, xcconfig: "Configuration/Apollo/Apollo-Project-Release.xcconfig"),
        .release(name: .performanceTesting, xcconfig: "Configuration/Apollo/Apollo-Project-Performance-Testing.xcconfig")
    ]),
    targets: [
        .animalKingdomFramework(),
        .starWarsFramework(),
        .gitHubFramework(),
        .uploadFramework(),
        .subscriptionFramework(),
        .apolloWrapperFramework(),
        .apolloCodegenLibWrapperFramework(),
        .apolloInternalTestHelpersFramework(),
        .apolloCodegenInternalTestHelpersFramework(),
        .apolloTests(),
        .apolloPerformanceTests(),
        .apolloServerIntegrationTests(),
        .apolloCodegenTests(),
        .codegenCLITests()
    ],
    schemes: [
        .apolloCodegenTests(),
        .apolloPerformanceTests(),
        .apolloServerIntegrationTests(),
        .apolloTests(),
        .codegenCLITests()
    ],
    additionalFiles: [
        .glob(pattern: "Tests/TestPlans/**")
    ]
)