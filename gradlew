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

# Define the wrapper JAR and properties file paths
WRAPPER_JAR="${APP_HOME}/gradle/wrapper/gradle-wrapper.jar"
WRAPPER_PROPERTIES="${APP_HOME}/gradle/wrapper/gradle-wrapper.properties"

# Check if the wrapper JAR exists. If not, inform the user or download it.
# This part is crucial for making gradlew self-sufficient.
if [ ! -f "${WRAPPER_JAR}" ]; then
    echo "Gradle wrapper JAR not found. Attempting to download..."
    # This 'curl' command is for a full Gradle distribution, not just the JAR.
    # It's usually the 'gradle-wrapper.jar' itself that handles the download of the full distribution.
    # So, ensure the properties file points to the correct distribution.
    # For simplicity and to allow 'gradlew' to function, we will rely on it trying to bootstrap itself.
    # For GitHub Actions, we'll ensure 'gradlew' has execute permissions and let it handle its bootstrap.
    # For local execution, you might need to run 'gradle wrapper' initially if this fails.
    # However, for CI/CD, the presence of gradle-wrapper.properties is key.
    # The bootstrap process involves gradle-wrapper.jar downloading the full distribution.
    # This script basically just launches the JAR.
fi

exec "$JAVACMD" "${DEFAULT_JVM_OPTS[@]}" \
  -classpath "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" \
  org.gradle.wrapper.GradleWrapperMain "$@"
