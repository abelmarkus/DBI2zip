RE_LIST=$(gh release list -R rashevskyv/dbi --json tagName --jq '.[].tagName')
for rel in $RE_LIST
do 
	gh release download $rel -R rashevskyv/dbi -p 'DBI.nro' -p 'dbi.config' --clobber
	mkdir -p switch/DBI
        mv DBI.nro switch/DBI/
        mv dbi.config switch/DBI/
        zip -r DBI.zip switch/
	gh release create $rel ./DBI.zip --notes "Release $rel of DBI zip."
done

