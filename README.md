# Xena

Prototype system for managing the comprehensive catalog data.

Check out the Confluence page [here](https://stanley.atlassian.net/wiki/display/XENA/Xena+Prototype).

## Goals of the project

Build a (microservice?) app that manages the comprehensive catalog data.  Show how we could do quick search of the sets and stamp data. Allow editing of the data, such as revised catalog prices,to feed back into the publication process. Expose an API to feed to the content enrichment strategy of the website.  Force us to go through some data analysis to learn about the structured data.

Worst case scenario: we learn something about the CCD, the use cases, etc.

Best case scenario: we have a working asset that needs to be productized.

## Getting Started

This setup assume you have MySQL running locally.

* Clone the repo.
* run ```bundle install```
* run ```rake db:create && db:migrate && db:seed```

## Running the app

Today, just run puma locally with ```rails s``` and point a browser at http://localhost:3000/stamps.

## Contributing

Fork the project.  Send me a pull request. 

## License

This project is licensed under the MIT License.

## Acknowledgments

tbd


