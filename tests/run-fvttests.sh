#!/bin/bash

cat << EOT >> fvttest.xml
<testsuite name="Functional Tests" tests="2" failures="0" errors="0" skipped="0" timestamp="Thu, 28 Jun 2018 01:03:46 GMT" time="0.011">
<testcase classname="Array #indexOf()" name="should return -1 when the value is not present" time="0"/>
<testcase classname="Array #indexOf()" name="exec" time="0.004"/>
</testsuite>
EOT

cat fvttest.xml