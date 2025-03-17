default:
	jekyll build

clean:
	jekyll clean

serve:
	jekyll serve

publish: default
	rsync -a ../aoc _site/
	rsync -a _site/ jh2054@jove.macs.hw.ac.uk:www/
  
# rsync -a _site/ ~/public_html/
#	updatewww
	

