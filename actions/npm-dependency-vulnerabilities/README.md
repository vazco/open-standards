# Npm security check action

This action check npm dependency vulnerabilities using [npm-audit](https://docs.npmjs.com/cli/v8/commands/npm-audit)

## Inputs

## `path`

**Optional** The path to node project. Default value is '.' (root).

## Example usage

```yaml
uses: vazco/open-standards/actions/npm-dependency-vulnerabilities/@master
with:
    path: 'applications/client'
```
