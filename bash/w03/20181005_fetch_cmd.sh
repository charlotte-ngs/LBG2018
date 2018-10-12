


# cat login_lbgfs2018_test.txt | while read s
cat login_lbgfs2018.txt | while read s
  do 
    echo $s
    cat w03/20181005_material_dir.txt | while read f
      do 
        echo $f
        ./fetch.sh -s $s -d $f
        sleep 2
      done
  done
