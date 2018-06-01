Manifesto: The Twelve Factor App

# 1. Codebase (https://12factor.net/codebase)
There is one app in a codebase and your code is in git.=

# 2. Dependencies (https://12factor.net/dependencies)
A twelve-factor app never relies on implicit existence of system-wide packages.

* a)  Declare all dependencies
* b)  Use dependency isolation tool during execution to ensure that no implicit dependencies “leak in” from the surrounding system

In Python there are two separate tools for these steps – Pip is used for declaration and Virtualenv for isolation

Twelve-factor apps also do not rely on the implicit existence of any system tools. Examples include shelling out to ImageMagick or curl.
[truncated]
If the app needs to shell out to a system tool, that tool should be vendored into the app.

My Notes:

y) Vendoring:
Many of these tools also have the ability to isolate dependencies.
This is done by analyzing the declared dependencies and bundling
(also called vendoring) those dependencies into some sub-structure
beneath or within the application artifact itself. (Beyond the 12-factor app, Kevin Hoffman)

z) Vendoring could also mean bundling system and language dependencies in a RPM (Redhad) or using Containers: LXC, docker, Rkt.


# 3. Config

A litmus test for whether an app has all config correctly factored out of the code is whether the codebase could be made open source at any moment, without compromising any credentials.

The twelve-factor app stores config in environment variables (env vars in short). This because it scales, as do ini files with groups per env do not.

My summary:
If a value can be a constant, but varies substantially across deploys, it is a config value. This should be stored in the environment.


# 4. Backing Services

The code for a twelve-factor app makes no distinction between local and third party services. To the app, both are attached resources, accessed via a URL or other locator/credentials stored in the config. A deploy of the twelve-factor app should be able to swap out a local MySQL database with one managed by a third party (such as Amazon RDS) without any changes to the app’s code.

# 5. Build, release, run

The twelve-factor app uses strict separation between the build, release, and run stages. For example, it is impossible to make changes to the code at runtime, since there is no way to propagate those changes back to the build stage.

# 6. Processes

Twelve-factor processes are stateless and share-nothing.
