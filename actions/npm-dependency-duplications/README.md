# Npm dependency duplications action

This action check npm dependency duplication using [npm-dedupe](https://docs.npmjs.com/cli/v7/commands/npm-dedupe)

## Inputs

## `project-path`

**Optional** The path to node project. Default value is '.' (root).

## Example usage
uses: vazco/open-standards/actions/npm-dependency-duplications/@master
with:
project-path: 'applications/client'
