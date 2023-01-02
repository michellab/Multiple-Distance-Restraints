for i in {1..5};
do
	cp -r template run00$i;
	cd run00$i;
	./runme.sh;
	cd ..;
done
