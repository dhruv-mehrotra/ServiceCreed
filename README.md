# Service Creed

## Setup Instructions
- Clone the repo:
    ```bash
	git clone https://github.com/dhruv-mehrotra/ServiceCreed.git
	cd ServiceCreed
	```
    
- Install flutter sdk   
    
- Open the repo in an IDE like Android Studio or VS Code
    click Open -> Flutter Project -> Service Creed
    
- Get Dev Dependencies
    ```bash
    flutter pub dev
    ```
- Run Project
    ```bash
    flutter run
    ```


## Use of files

    models -> All data models and response models
    enums -> All enums files
    services -> Any services and API service classes
    ui/views -> All app views
    ui/utils -> All utility functions
    ui/components -> All view components like custom buttons, custom cards etc.
    viewmodels -> All viewmodels

## Structure code in this way:

    // Inside widget class
    -- variables (private if possible)
    -- build method (Inside build(), use sub methods like _buildAppBar()
    -- sub-build methods
    -- other methods
    -- utility methods

## For commit messages

Please start your commits with these prefixes for better understanding among collaborators, based on the type of commit:

    feat: (addition of a new feature)
    rfac: (refactoring the code: optimization/ different logic of existing code - output doesn't change, just the way of execution changes)
    docs: (documenting the code, be it readme, or extra comments)
    bfix: (bug fixing)
    chor: (chore - beautifying code, indents, spaces, camelcasing, changing variable names to have an appropriate meaning)
    ptch: (patches - small changes in code, mainly UI, for example color of a button, incrasing size of tet, etc etc)
    conf: (configurational settings - changing directory structure, updating gitignore, add libraries, changing manifest etc)
    
### Branch naming conventions to follow

```groovy
For new features: feature/{featureName}
For hotfix: hotfix/{hotfixIssueName}
For release: release/{releaseNo}
For clickup ticket fixes: bugfix/{ticketNo}
```

## Getting Started

This project is a Flutter Application

## Reference

[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
