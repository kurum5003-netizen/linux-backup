#!/bin/bash

destination="./backup"
source_dir=""

check_source() {
    local target="$1"

    if [[ ! -d "$target" ]]
    then
        echo "Geçerli bir kaynak dizin girin. (-s)"
        exit 1
    fi
}

prepare_destination() {
    local target="$1"

    if mkdir -p "$target" > /dev/null 2>&1
    then
        echo "Destination hazır: $target"
    else
        echo "Destination oluşturulamadı: $target"
        exit 1
    fi
}

create_backup() {
    if tar -czf "$backup_file" "$source_dir" > /dev/null
    then
        echo "Yedekleme başarılı."
        echo "Backup: $backup_file"
        echo "Boyut: $(du -h "$backup_file" | awk '{print $1}')"
    else
        echo "Yedekleme başarısız."
        exit 1
    fi
}

while getopts "s:d:" opt
do
    case "$opt" in
        s)
            source_dir="$OPTARG"
            ;;
        d)
            destination="$OPTARG"
            ;;
        *)
            echo "Kullanım: $0 -s SOURCE [-d DESTINATION]"
            exit 1
            ;;
    esac
done

backup_file="$destination/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

check_source "$source_dir"
prepare_destination "$destination"
create_backup

exit 0
