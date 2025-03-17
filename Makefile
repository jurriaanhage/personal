default:
	jekyll build

clean:
	jekyll clean

serve:
	jekyll serve

publish: default
	rsync -a ../aoc _site/
	cd _site
	echo "If you introduced new files, make sure you git add them in _site"
	git push
	#rsync -a _site/ jh2054@jove.macs.hw.ac.uk:www/
  
# rsync -a _site/ ~/public_html/
#	updatewww
	

