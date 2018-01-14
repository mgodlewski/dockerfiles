#!/usr/bin/env bash
set -e

organisation=$1
diacamma_type=$2

echo Organisation: $organisation
echo Type: $diacamma_type

if [ ! -f /var/lucterios2/$organisation/settings.py ]
then
  /var/lucterios2/launch_lucterios.sh add -n $organisation -m "lucterios.contacts,lucterios.documents,lucterios.mailing,diacamma.condominium,diacamma.accounting,diacamma.payoff" -p diacamma.$diacamma_type
fi

export DJANGO_SETTINGS_MODULE="${organisation}.settings"
exec /var/lucterios2/virtual_for_lucterios/bin/python3 /var/lucterios2/manage_any.py runserver --noreload --traceback 0.0.0.0:8100

