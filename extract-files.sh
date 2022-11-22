
readarray lines < <(grep ^[[:space:]]*file bibliography.bib)

readarray -d '\n' extracted < <(for line in "${lines[@]}"
do
    if [[ "$line" =~ file[[:space:]]*=[[:space:]]*\{(.*)\} ]]
    then
        echo "${BASH_REMATCH[1]}"
    fi
done)

readarray -d '\n' actual < <(find ./files/*)

case ${1:?Option missing} in
unprocessed)
    comm -1 -3  <(sort -u <<<"${extracted[@]}") <(sort -u <<<"${actual[@]}")
    ;;
missing)
    comm -2 -3 <(sort <<<"${extracted[@]}") <(sort <<<"${actual[@]}")
    ;;
esac




#
#echo "Missing"
#IFS='\n' comm -2 -3 <(sort <<<"${extracted[@]}") <(sort <<<"${actual[@]}")
