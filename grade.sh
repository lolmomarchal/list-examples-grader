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
cp TestListExamples.java ../testingdir
#going inside testing and then running junit

cd testingdir

set +e
javac -cp ."lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java

if [[ $? -eq 0 ]]; then
  echo "Could not compile files. Compilation error in: "
  2 >compiler-err.txt
  cat compiler-err.txt

fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar org.junit.runner.JUnitCore" TestListExamples
