const process = require('process');
const cp = require('child_process');
const path = require('path');

function runTestFile(filename, env) {
    const filePath = path.join(__dirname, filename);
    return cp.execSync(`node ${filePath}`, {env}).toString();
}

test('test runs', () => {
    process.env['INPUT_PATH'] = "test/negative";
    const result = runTestFile('index.js', process.env)
    console.log("result", result)
    expect(result.includes("No dependency duplication found.")).toBeTruthy()
    expect(result.includes("::warning")).toBeFalsy()
})
test('test runs', () => {
    process.env['INPUT_PATH'] = "test/positive";
    const result = runTestFile('index.js', process.env)

    expect(result
            .includes("::warning file=test/positive/package-lock.json::Dependency duplications found. Run npm dedupe to fix them."))
        .toBeTruthy()
})

