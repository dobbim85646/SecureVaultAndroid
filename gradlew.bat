@if "%DEBUG%" == "" @echo off
@rem ###########################################################################
@rem
@rem  Gradle wrapper script for Windows
@rem
@rem ###########################################################################

set APP_HOME=%~dp0

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

"%JAVA_HOME%\bin\java" %DEFAULT_JVM_OPTS% -classpath "%APP_HOME%\gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*
