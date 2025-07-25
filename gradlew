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

exec "$JAVACMD" "${DEFAULT_JVM_OPTS[@]}" \
  -classpath "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" \
  org.gradle.wrapper.GradleWrapperMain "$@"
