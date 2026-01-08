# JoltPhysics Swift Package (binary build repo)

This repository builds a precompiled iOS `xcframework` for JoltPhysics and publishes it as a Swift Package
(binary target).

## How it works
- GitHub Actions clones **JoltPhysics**.
- The build script creates `JoltPhysics.xcframework` and zips it.
- The release asset URL + checksum are written into `Package.swift`.

## Consumer usage
1. Add the package in Xcode (File > Add Packages).
2. Include build settings before any Jolt header:

```cpp
#include <Jolt/JoltBuildSettings.h>
#include <Jolt/Jolt.h>
```

## Maintainer flow
1. Run the workflow (`Build and Release`) with the desired Jolt ref and release tag.
2. The workflow updates `Package.swift`, commits it to the selected branch, and tags that commit.
3. Metal compute is enabled by default. The workflow selects `latest-stable` Xcode.

Defaults (as of January 8, 2026):
- `xcode_version`: `latest-stable` (currently Xcode 16.4)
- `ios_deployment_target`: `18.0` (latest stable iOS major)
- `update_branch`: `main`

If you want beta toolchains (Xcode 26b* / iOS 26), set `xcode_version=latest` and `ios_deployment_target=26.0`.

## Scripts
- `scripts/build_jolt_xcframework.sh`: builds and zips the xcframework.
- `scripts/update_package_swift.sh`: updates URL/checksum in `Package.swift`.
