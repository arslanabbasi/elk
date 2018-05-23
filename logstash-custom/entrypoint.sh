#!/bin/sh
set -e

echo "I am in Entrypoint"
echo $FILESERVER

FILESERVER="10.40.206.190:8080"
CONFIGFILE="configure-logstash.sh"
if [ -z $FILESERVER ]
then
  echo "[INFO] No file server configured for configuration!"
  echo "[INFO]To dynamically run script inside the container at start time for configuration, configure the 'FILESERVER' environemnt variable with the server's IP"
else
  if [ -z $CONFIGFILE ]
  then
    echo "[ERROR] No config file configured"
    echo "[ERROR] Please populate 'CONFIGFILE' environment variable with the file you want to use for configuration"
  else
    curl "$FILESERVER/$CONFIGFILE" -o /usr/share/logstash/prepare.sh
    chmod +x /usr/share/logstash/prepare.sh
    echo "I have downloaded $CONFIGFILE"
    echo $(whoami)
  fi

fi

echo $pwd
echo "Handing off to CMD!!"
## Do whatever you need with env vars here ...

# Hand off to the CMD
exec "$@"
