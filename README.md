# Disney Code Test

![Screenshot of iOS App](https://kl-store1.s3.us-west-1.amazonaws.com/rr_screenshot.jpg)

### Summary

A simple two-view iOS application used to browse a Marvel comic book title, description and cover image, by *comicID*.  Written in both Swift and Objective-C to demonstrate proficiency in both legacy and current iOS methodologies/languages.
The UI is written in Swift utilizing MVC architecture.  Network services are written in Objective-C using async blocks.

### API Key Security

API Keys are secured via *xcconfig* file and referenced via the source's plist file. This file would normally be gitignored and not packaged with the source. In this project the *Secrets.xcconfig* file is located in the Assets folder in the main project folder.

### Mobile Code Test Requirements
- [x] Use Marvel's Developer API "developer.marvel.com" <br/>
- [x] Take one comic ID and display: <br/>
    - [x] Comic Book Title <br/>
    - [x] Description <br/>
    - [x] Cover Image <br/>
- [x] Implement at least one UI and unit test <br/>

### Author
By Ricardo Ruiz <br/>
ricardo@kenetic-labs.com <br/>
DIRECT: 213-842-5036 <br/>
