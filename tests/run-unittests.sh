#!/bin/bash

cat << EOT >> unittest.xml
<testsuite name="Mocha Tests" tests="2" failures="0" errors="0" skipped="0" timestamp="Thu, 28 Jun 2018 01:03:46 GMT" time="0.011">
<testcase classname="Array #indexOf()" name="should return -1 when the value is not present" time="0"/>
<testcase classname="Array #indexOf()" name="exec" time="0.004"/>
</testsuite>
EOT

cat unittest.xml
python3 prepUtils.py --publishdeployrecord True --env ${LOGICAL_ENV_NAME} --status 'pass'
python3 prepUtils.py --publishbuildrecord True --branch ${GIT_BRANCH} --repositoryurl ${GIT_URL} --commitid ${GIT_COMMIT} --status 'pass'
