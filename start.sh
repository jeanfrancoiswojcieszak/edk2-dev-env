#!/bin/bash

docker run  -it --rm -v ./ProjectFiles:/app/ProjectPkg -v ./out:/app/edk2/Build --name mybuildinginstance edk2-dev-v01
