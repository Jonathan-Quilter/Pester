Set-StrictMode -Version Latest

# This test depends on some state set up in GlobalMock-A.Tests.ps1.  The behavior we're verifying
# is that global functions that have been mocked are still properly set up even after the test
# script exits its scope.

try {
    Describe 'Mocking Global Functions - Part Two' {
        It 'Restored the global function properly' {
            $functionName = '01c1a57716fe4005ac1a7bf216f38ad0'
            $globalFunctionExists = Test-Path Function:\global:$functionName
            $globalFunctionExists | Should -Be $true
            & $functionName | Should -Be 'Original Function'
        }
    }
}
finally {
    $functionName = '01c1a57716fe4005ac1a7bf216f38ad0'
    if (Test-Path Function:\$functionName) {
        Remove-Item Function:\$functionName -Force
    }
}
