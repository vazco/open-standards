# vazco/open-standards

This repository was created to share the open standards adopted in Vazco.

## GitHub Workflows

Under the `/actions/` path we have reusable actions that may be used in any workflow in your project. 
Actions project structure, tests, and deployment flow are based on the official [javascript-action](https://github.com/actions/javascript-action) template.

They are written in JS using [GitHub Actions Toolkit](https://github.com/actions/toolkit) which provides functions to interact with workflow API, allows system calls, cache management and more.  

The usage of reusable workflows is described here: [learn-github-actions/reusing-workflows](https://docs.github.com/en/actions/learn-github-actions/reusing-workflows)
Example PR on adding workflows to repository: [vazco/uniforms PR#1076](https://github.com/vazco/uniforms/pull/1076)
