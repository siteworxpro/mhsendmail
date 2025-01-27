#!/usr/bin/env bash

go install

for distro in $(go tool dist list)
do
    arrIN=(${distro//\// })

    if [[ ${arrIN[0]} == 'linux' || ${arrIN[0]} == 'darwin'  || ${arrIN[0]} == 'freebsd' || ${arrIN[0]} == 'windows' ]]; then
      echo "Building $distro..."
      GOOS=${arrIN[0]} GOARCH=${arrIN[1]} go build -o dist/mhsendmail_${arrIN[0]}_${arrIN[1]}
    fi
done

