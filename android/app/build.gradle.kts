import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Release signing (plan §9.2). android/key.properties is git-ignored and points
// at the keystore kept OUTSIDE the repo. Never commit either file.
val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties().apply {
    if (keystorePropertiesFile.exists()) FileInputStream(keystorePropertiesFile).use { load(it) }
}
val hasReleaseKey = keystorePropertiesFile.exists()

android {
    // Must never change: in-place updates (and the owner's data) depend on it.
    namespace = "com.muhammadyaseen.planyar"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // Required by flutter_local_notifications for scheduled notifications.
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    buildFeatures {
        resValues = true
    }

    defaultConfig {
        // Must never change (D-01). The dev flavor adds ".dev".
        applicationId = "com.muhammadyaseen.planyar"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (hasReleaseKey) {
            create("release") {
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
            }
        }
    }

    // dev installs beside prod with its own ID, name and database (plan §8.12).
    flavorDimensions += "env"
    productFlavors {
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"
            versionNameSuffix = "-dev"
            resValue("string", "app_name", "Planyar Dev")
        }
        create("prod") {
            dimension = "env"
            resValue("string", "app_name", "Planyar")
        }
    }

    buildTypes {
        release {
            // No debug-key fallback: a debug-signed APK on the phone would block
            // every future update. Without key.properties the build stops below.
            signingConfig = if (hasReleaseKey) signingConfigs.getByName("release") else null
        }
    }
}

// Fail early with a clear message instead of producing an unsigned release.
gradle.taskGraph.whenReady {
    val buildsRelease = allTasks.any { it.name.matches(Regex("(assemble|bundle|package).*Release")) }
    if (buildsRelease && !hasReleaseKey) {
        throw GradleException(
            "Release builds need android/key.properties pointing at the release keystore " +
                "(kept outside the repo). See docs/RELEASE.md.",
        )
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
