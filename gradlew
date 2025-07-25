#!/usr/bin/env bash
##############################################################################
##
##  Gradle wrapper script for UNIX
##
##############################################################################

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/bin/java" ] ; then
        JAVACMD="$JAVA_HOME/jre/bin/java"
    elif [ -x "$JAVA_HOME/bin/java" ] ; then
        JAVACMD="$JAVA_HOME/bin/java"
    fi
fi

if [ ! -x "$JAVACMD" ] ; then
    JAVACMD=$(which java)
fi

if [ ! -x "$JAVACMD" ] ; then
    echo "Error: JAVA_HOME is not defined correctly."
    echo "       Cannot execute $JAVACMD"
    exit 1
fi

APP_HOME=$(
  cd $(dirname "$0")
  pwd -P
)

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# The project root directory
APP_BASE_NAME=$(basename "${APP_HOME}")

# Set the Gradle distribution URL for the wrapper (adjust version as needed)
GRADLE_DISTRIBUTION_URL="https://services.gradle.org/distributions/gradle-8.2-bin.zip"

# Set the wrapper JAR path relative to the project root
WRAPPER_JAR="${APP_HOME}/gradle/wrapper/gradle-wrapper.jar"

# Check if the wrapper JAR exists, if not, try to download it
if [ ! -f "${WRAPPER_JAR}" ]; then
    echo "Downloading Gradle wrapper JAR..."
    mkdir -p "${APP_HOME}/gradle/wrapper"
    curl -L -o "${WRAPPER_JAR}" "${GRADLE_DISTRIBUTION_URL/.zip/-all.jar}" # Ensure you download the .jar not the .zip
    if [ $? -ne 0 ]; then
        echo "Failed to download Gradle wrapper JAR."
        exit 1
    fi
fi

exec "$JAVACMD" "${DEFAULT_JVM_OPTS[@]}" \
  -classpath "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" \
  org.gradle.wrapper.GradleWrapperMain "$@"
