# PhD dissertation

# dissertation

my dissertation at the uc berkeley school of information

## usage

`make html` - builds html version to dist/

`make pdf` - builds pdf version to dist/

`make watch` - watches for changes to md, and builds html, refreshing a browser page via [BrowserSync](http://www.browsersync.io/)

## prerequisites

### cross-platform

    npm install

### OS X

you will need [pandoc](http://pandoc.org/) to compile anything, which is easily installed 

for pdf output, you'll also need LaTeX. 

installing [mactex](http://tug.org/mactex/mactex-download.html) will work out of the box on OSX.

but, you may need to add the relavent bins to your path:

    export PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin  

### debian/ubuntu

you'll need to install pandoc and pandoc-citeproc. 

try installing these from your package manager. if `make` commands hang, 
try installing cabal and using that to compile + install these dependencies:

	sudo apt-get install cabal-install
	cabal update
	cabal install pandoc
	cabal install pandoc-citeproc

once it's installed, you may want to place the bin somewhere reasonable:

	sudo cp ~/.cabal/bin/pandoc /usr/bin  
	sudo cp ~/.cabal/bin/pandoc-citeproc /usr/bin  


