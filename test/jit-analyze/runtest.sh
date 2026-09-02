# Run analysis tool with indentical input and ensure that we get no diffs.

if jit-analyze --base ./base/test1.dasm --diff ./diff/test1.dasm > test1.out; then
    echo "Test1: Passed null diff test"
else
    echo "Test1: Failed"
fi

if diff ./test1.out ./baseline1.out; then
    echo "Test1: Passed baseline check"
else
    echo "Test1: Failed baseline check"
fi     

jit-analyze --base ./base/test2.dasm --diff ./diff/test2.dasm > test2.out
RESULT=$?
#echo $RESULT
if [ $RESULT == 0 ]; then
    echo "Test2: Passed diff command"
else
    echo "Test2: Failed"
fi

if diff ./test2.out ./baseline2.out; then
    echo "Test2: Passed baseline check"
else
    echo "Test2: Failed baseline check"
fi

jit-analyze --base ./base --diff ./diff > test3.out
RESULT=$?
#echo $RESULT
if [ $RESULT == 26 ]; then
    echo "Test3: Passed diff command"
else
    echo "Test3: Failed"
fi

if diff ./test3.out ./baseline3.out; then
    echo "Test3: Passed baseline check"
else
    echo "Test3: Failed baseline check"
fi

jit-analyze --base ./base/test4.dasm --diff ./diff/test4.dasm > test4.out
RESULT=$?
if [ $RESULT == 0 ]; then
    echo "Test4: Passed release JIT format command"
else
    echo "Test4: Failed release JIT format command"
fi

if diff ./test4.out ./baseline4.out; then
    echo "Test4: Passed release JIT format baseline check"
else
    echo "Test4: Failed release JIT format baseline check"
fi
