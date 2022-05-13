const core = require('@actions/core');
const exec = require('@actions/exec');

async function main() {
  try {
    const path = core.getInput('path', { required: true });
    const opts = {
      cwd: path ? path : undefined,
      ignoreReturnCode: true,
    };

    await exec.getExecOutput(
      'cp package-lock.json package-lock-copy.json',
      [],
      opts,
    );
    await exec.getExecOutput('npm dedupe', [], opts);
    const { stdout: diffOutput } = await exec.getExecOutput(
      'diff package-lock.json package-lock-copy.json',
      [],
      opts,
    );

    if (diffOutput === '') {
      core.info('No dependency duplication found.');
    } else {
      core.warning(
        'Dependency duplications found. Run npm dedupe to fix them.',
        { file: `${path}/package-lock.json` },
      );
    }
    await exec.getExecOutput('rm package-lock.json', [], opts);
    await exec.getExecOutput(
      'mv package-lock-copy.json package-lock.json',
      [],
      opts,
    );

    const { stdout: nodeVOutput } = await exec.getExecOutput(
      'node -v',
      [],
      opts,
    );
    core.info(`Node -v output: ${nodeVOutput}`);
  } catch (error) {
    core.warning(error.message);
  }
}

main();
