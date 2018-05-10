#!/bin/sh

if [ -z $FILESERVER]
then
  echo "[INFO] No file server configured for configuration!"
  echo "[INFO]To dynamically run script inside the container at start time for configuration, configure the 'FILESERVER' environemnt variable with the server's IP"
  exit 0
fi

if [ -z $CONFIGFILE]
then
  echo "[ERROR] No config file configured"
  echo "[ERROR] Please populate 'CONFIGFILE' environment variable with the file you want to use for configuration"
  exit 1
fi

echo "I am here"
echo $pwd
echo "I am here"
## Do whatever you need with env vars here ...

# Hand off to the CMD
exec "$@"
