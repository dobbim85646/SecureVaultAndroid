@if "%DEBUG%" == "" @echo off
@rem ###########################################################################
@rem
@rem  Gradle wrapper script for Windows
@rem
@rem ###########################################################################

@rem Set the Gradle distribution URL for the wrapper (adjust version as needed)
set GRADLE_DISTRIBUTION_URL=https://services.gradle.org/distributions/gradle-8.2-bin.zip

@rem Set the wrapper JAR path relative to the project root
set WRAPPER_JAR=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

@rem Check if the wrapper JAR exists, if not, try to download it
if not exist "%WRAPPER_JAR%" (
    echo Downloading Gradle wrapper JAR...
    mkdir "%APP_HOME%\gradle\wrapper" 2>NUL
    bitsadmin /transfer "DownloadWrapper" %GRADLE_DISTRIBUTION_URL:.zip/-all.jar% "%WRAPPER_JAR%"
    if %errorlevel% neq 0 (
        echo Failed to download Gradle wrapper JAR.
        exit /b 1
    )
)

set APP_HOME=%~dp0

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

"%JAVA_HOME%\bin\java" %DEFAULT_JVM_OPTS% -classpath "%APP_HOME%\gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
