for file in `ls ./$1/*.sh`; do
  echo $file;
  sudo ./start_one.sh $file
done;
