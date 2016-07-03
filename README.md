# Xena

Prototype system for managing the comprehensive catalog data.

## Problem Statement

The comprehensive catalog data (CCD) is only in XML files. The current publishing process is to feed these discrete catalog/XML files into InDesign and print pubs from there.

* The CCD is not updated/managed via a system.  Changes are marked in pencil in the printed paper catalog, and the pubs team manually updates the XML and then reprints the catalog.
* The CCD is not usable in any other system.
* The simplified catalog data is managed in STEP, and then fed into InDesign for printing.
* The CCD is logically separated by catalog.  It is not possible to search across catalogs.


## Goals of the project

Build a microservice app that manages the comprehensive catalog data.  Show how we could do quick search of the sets and stamp data. Allow editing of the data, such as revised catalog prices,to feed back into the publication process. Expose an API to feed to the content enrichment strategy of the website.  Force us to go through some data analysis to learn about the structured data.

Worst case scenario: we learn something about the CCD, the use cases, etc.

Best case scenario: we have a working asset that needs to be productized.


## Prototype Context

![Context](/public/xenap.png?raw=true "Xena in action")


## Getting Started

This setup assume you have MySQL running locally.

* Clone the repo.
* Run ```bundle install```
* Run ```rake db:create && db:migrate```
* Go into the "vendor/image-fixer" folder
* Run ```./get.sh``` to download the TIFFs using curl
* Run ```./convert.sh``` to convert them to JPGs ( make sure you install imagemagick with $brew install imagemagick --with-libtiff)
* Run ```./move.sh``` to copy the usable images into app folder(s) in xena for ephemeral storage


## Running the app

Run ```ruby runme.rb```

Point a browser at http://localhost:3000. 


## Contributing

Fork the project.  Send me a pull request. 

## License

This project is licensed under the MIT License.



