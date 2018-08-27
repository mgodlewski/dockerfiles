#!/usr/bin/env bash
set -e

organisation=${DIACAMMA_ORGANISATION:-asso}
diacamma_type=${DIACAMMA_TYPE:-asso}
diacamma_database=${DIACAMMA_DATABASE}

echo Organisation: $organisation
echo Type: $diacamma_type

# Wait for DB to be ready before starting this
[ "$diacamma_database" != "" ] && sleep 10

if [ ! -f /var/lucterios2/$organisation/settings.py ]
then
  case "$diacamma_type" in
    asso)
      modules="lucterios.contacts,lucterios.documents,lucterios.mailing,diacamma.accounting,diacamma.payoff,diacamma.event,diacamma.member,diacamma.invoice"
      ;;
    syndic)
      modules="lucterios.contacts,lucterios.documents,lucterios.mailing,diacamma.accounting,diacamma.payoff,diacamma.condominium"
      ;;
    *)
      echo 'Missing type, please set "asso" or "syndic"'
      exit 1
      ;;
  esac

  database_parameter=""
  [ "$diacamma_database" != "" ] && database_parameter="-d $diacamma_database"

  /var/lucterios2/launch_lucterios.sh add -n $organisation -m "$modules" -p diacamma.$diacamma_type $database_parameter

  echo "LANGUAGE_CODE = 'fr'" >> /var/lucterios2/$organisation/settings.py
  echo "ALLOWED_HOSTS = [ '*' ]" >> /var/lucterios2/$organisation/settings.py
fi

cd /var/lucterios2
source virtual_for_lucterios/bin/activate
export DJANGO_SETTINGS_MODULE="${organisation}.settings"

[ "$diacamma_database" != "" ] && /var/lucterios2/launch_lucterios.sh refreshall

exec gunicorn lucterios.framework.wsgi --bind=0.0.0.0:8100 --access-logfile - --error-logfile -
