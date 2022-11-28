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
SCORE=0;
javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
   then
       echo "Compiled, good job!"
        SCORE=1
       java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 2> err.txt
        ERR=$(grep "FAILURES" err.txt)
       if [[ $ERR == "FAILURES!!" ]]
       then
         cat err.txt
         echo "Your code failed at least one test, please resubmit"

         else
           SCORE=2
           exit
      fi


   else
     java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 2> out-err.txt
       echo "Compile failed, here are the errors found."
       cat out-err.txt
       echo $SCORE
       exit 1
   fi
   echo $SCORE
