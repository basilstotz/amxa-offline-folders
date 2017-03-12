if  test -n "$PUAVO_TAG_HOMESYNC"; then

  TYPE=$(jq .type /etc/puavo/device.json|sed 's/"//g')
  PERSONAL_DEVICE=$(jq .personal_device /etc/puavo/device.json)
  PRIMARY_USER=$(jq .primary_user /etc/puavo/device.json|sed 's/"//g')

  if test "$TYPE" = "laptop" -a "$USER" = "$PRIMARY_USER" -a "$PERSONAL_DEVICE" = "true"; then


     if  test -e $HOME/.ssh/id_dsa; then
        /usr/share/bin/amxa-offline-folders &
     else
        if ! test -d $HOME/.ssh; then
          mkdir $HOME/.ssh
        fi
        ssh-keygen -t dsa -f $HOME/.ssh/id_dsa -N ""
        cp $HOME/.ssh/id_dsa.pub $HOME/.ssh/authorized_keys
     fi

  fi

fi
