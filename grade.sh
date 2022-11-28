# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission
Directory=testingdir
if ! [[ -d "$DIRECTORY" ]]; then
  rm -rf testingdir

fi
# checking if files are inside
File=ListExamples.java

if [[ -f "$FILE" ]]; then
  echo "Missing listExamples File, please submit again"
  exit
fi

#making new directory and putting list examples + tests inside

mkdir testingdir
cd student-submission
cp ListExamples.java ../testingdir
cd ..
cp TestListExamples.java testingdir
#going inside testing and then running junit

cd testingdir

set +e

CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

COMPILEERROR= -cp $CPATH *.java 2> all-error.txt

javac -cp $CPATH *.java
  if [[ $? -eq 0 ]]
  then
    java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples 2> all-error.txt

    error=$(grep "FAIL" runtime-error.txt)
    if [[ error == "FAIL" ]]
    then
      echo "Your code had the following errors"
      cat all-error.txt
      echo "Code did not compile properly, please try again "

      exit 1
    fi
    else
      echo "Your code compiled properly"
      echo "100%"
    exit 0
  fi


