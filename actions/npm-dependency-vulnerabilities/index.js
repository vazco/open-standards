const core = require('@actions/core');
const exec = require('@actions/exec');

async function main() {
    try {
        const path = core.getInput('path', {required: true});

        const {exitCode, stdout: auditOutput} = await exec.getExecOutput(`npm audit --dry-run`, [], {
            cwd: path ? path : undefined,
            ignoreReturnCode: true
        })

        if (exitCode === 0) {
            core.info('No vulnerabilities found.')
        } else {
            core.warning(`Dependency vulnerabilities found. Run npm audit to get more info.`, {file: `${path}/package-lock.json`})
        }
    } catch (error) {
        core.warning(error.message);
    }
}

main()
