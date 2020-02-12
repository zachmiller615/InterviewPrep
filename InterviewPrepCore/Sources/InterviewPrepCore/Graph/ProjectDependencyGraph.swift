//
// Created by Zach Miller on 12/02/2020.
//

/// Question from "Cracking the Coding Interview" by Gayle Laakmann Mcdowell:
/// You are given a list of projects and a list of dependencies (which is a list of pairs of projects, where the second project is dependent on the first project).
/// All of a project's dependencies must be built before the project is.
/// Find a build order that will allow the projects to be built.
/// If there is no valid build order, return an error.
class ProjectDependencyGraph<Element: Hashable> {
    // Type Alias
    typealias DependencyPair = (dependency: Element, project: Element)

    // Properties
    private var dependencyMap: [Element: Set<Element>] = [:]
    private var projectsToBuild: Set<Element> = []
    private var projectsBuilt: Set<Element> = []
    private var resultBuildOrder: [Element] = []

    // Methods
    func createBuildOrder(projects: [Element], dependencyPairs: [DependencyPair]) -> [Element]? {
        self.dependencyMap = self.buildDependencyMap(projects: projects, dependencyPairs: dependencyPairs)
        self.projectsToBuild = Set(projects)
        self.projectsBuilt = []
        self.resultBuildOrder = []

        while (!self.projectsToBuild.isEmpty) {
            let currentProject = self.projectsToBuild.removeFirst()
            let buildOrderIsValid = self.addToBuildOrder(currentProject: currentProject)
            guard buildOrderIsValid else {
                return nil
            }
        }
        return self.resultBuildOrder
    }
}

// Private Methods
private extension ProjectDependencyGraph {
    func buildDependencyMap(projects: [Element], dependencyPairs: [DependencyPair]) -> [Element: Set<Element>] {
        var dependencyMap: [Element: Set<Element>] = [:]
        for pair in dependencyPairs {
            if (dependencyMap[pair.project] != nil) {
                dependencyMap[pair.project]?.insert(pair.dependency)
            } else {
                dependencyMap[pair.project] = [pair.dependency]
            }
        }
        for project in projects {
            if (dependencyMap[project] == nil) {
                dependencyMap[project] = []
            }
        }
        return dependencyMap
    }

    // Bool return type denotes if it is still possible to create a valid build order
    func addToBuildOrder(currentProject: Element) -> Bool {
        let currentProjectDependencies = (self.dependencyMap[currentProject] ?? [])
        for dependency in currentProjectDependencies {
            if self.projectsToBuild.contains(dependency) {
                self.projectsToBuild.remove(dependency)
                let buildOrderIsValid = self.addToBuildOrder(currentProject: dependency)
                guard buildOrderIsValid else {
                    return false
                }
            } else if !self.projectsBuilt.contains(dependency) {
                return false // Cycle detected in dependency map
            }
        }
        self.resultBuildOrder.append(currentProject)
        self.projectsBuilt.insert(currentProject)
        return true
    }
}