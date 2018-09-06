for file in `ls ./$1/*.sh`; do
  sudo ./get_url_for_student.sh $file
done;
