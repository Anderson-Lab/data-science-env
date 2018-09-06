for file in `ls ./$1/*.sh`; do
  echo $file;
  sudo ./start_for_student.sh $file
done;
