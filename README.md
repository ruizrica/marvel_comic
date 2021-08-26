# Coding Demo

![Screenshot of iOS App](https://kl-store1.s3.us-west-1.amazonaws.com/rr_screenshot.jpg)

### Summary

A simple two-view iOS application used to browse a Marvel comic book title, description and cover image, by *comicID*.  Written in both Swift and Objective-C to demonstrate proficiency in both legacy and current iOS methodologies/languages.
The UI is written in Swift utilizing MVC architecture.  Network services are written in Objective-C using asynchronous blocks.

### API Key Security

API Keys are secured via *xcconfig* file and referenced via the source's plist file. This file would normally be gitignored and not packaged with the source. In this project the *Secrets.xcconfig* file is located in the Assets folder in the main project folder.

### Mobile Code Test Requirements
- [x] Use Marvel's Developer API "developer.marvel.com" <br/>
- [x] Take one comic ID and display: <br/>
    - [x] Comic Book Title <br/>
    - [x] Description <br/>
    - [x] Cover Image <br/>
- [x] Implement at least one UI and unit test <br/>
    - [x] testAPIKeys <br/>
    - [x] testAPIConntection <br/>
    - [x] UI Test - testDrawUI_mockup <br/>
    - [x] UI Test - testDrawUI_main_button <br/>
- [x] Upload code to Github and provide and README file :)<br/>
- [x] Specify which libraries you are using: <br/>
    - [NSHash](https://github.com/jerolimov/NSHash) - NSHash adds hashing methods to NSString and NSData.  Required to sign API requests. <br/>
- [x] Specify how to add your developer keys <br/>
    - Replace *kAPI_PublicKey* and *kAPI_PrivateKey* in *Secrets.xcconfig* in the Assets folder with your Public and Private keys <br/>

### Note
- An MD5 hash is required to sign API requests.

>Warning from Xcode: *'CC_MD5' is deprecated: first deprecated in iOS 13.0 - This function is cryptographically broken and should not be used in security contexts. Clients should migrate to SHA256 (or stronger).*
>

### Author
By Ricardo Ruiz <br/>
ricardo@kenetic-labs.com <br/>
