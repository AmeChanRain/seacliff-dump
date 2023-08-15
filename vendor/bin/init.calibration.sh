#!/vendor/bin/sh
if [ ! -f "/persist/PROX_ONLINE_PS_CANC" ]
then
  cp /persist/PROX_PS_CANC /persist/PROX_ONLINE_PS_CANC
fi
