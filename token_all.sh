for file in `ls ./$1/*.sh`; do
  echo $file
  sudo ./get_token_for_student.sh $file
done;
