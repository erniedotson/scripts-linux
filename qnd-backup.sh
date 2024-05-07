#!/bin/bash
##############################################################################
# PURPOSE    : Quick and Dirty backup script to backup home directory 
#            : (i.e. one of my vagrants) to a specified file location
#            : (dir mount).
# PARAMETERS : None
# RETURNS    : 0 on success, non-zero on failure
# REMARKS    : Has dependencies on restic, as well as RESTIC_* environment
#            : variables. If not provided, opinionated defaults will be used.
#            : Assumes the restic repo has already been created with:
#            : "restic init --repo /path/to/repo"
#            : Run every hour by adding the following cron schedule:
#            : 0 * * * * /path/to/qnd-backup.sh
##############################################################################

set -euo pipefail
IFS=$'\n\t'

function die() {
    echo "$*" 1>&2 ; exit 1;
}

export RESTIC_BACKUP_SRC="${RESTIC_BACKUP_SRC:-/home/vagrant}"
export RESTIC_REPOSITORY="${RESTIC_REPOSITORY:-/vagrant/backups}"
export RESTIC_PASSWORD="${RESTIC_PASSWORD:-password}"

echo ${RESTIC_PASSWORD} | sudo restic -r "${RESTIC_REPOSITORY}" backup ${RESTIC_BACKUP_SRC} || die "Failed to perform restic backup."
echo ${RESTIC_PASSWORD} | sudo restic -r "${RESTIC_REPOSITORY}" forget --keep-daily 3 --keep-weekly 4 --keep-monthly 3 --keep-yearly 2 --prune || die "Failed to delete old backups."
