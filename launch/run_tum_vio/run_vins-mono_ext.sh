
#!/bin/bash

# David Z, Sep 11, 2018 (hzhang8@vcu.edu)
# 
# run rvins_mono_ext with given bagfile and times 
# ./run_rovio.sh  
#

# rosbag_name_list="corridor1 corridor2 corridor3 corridor4 corridor5 magistrale1 magistrale2 magistrale3 magistrale4 magistrale5 magistrale6 outdoors1	outdoors2 outdoors3 outdoors4 outdoors5 outdoors6 outdoors7 outdoors8 room1 room2 room3 room4 room5 room6 slides1 slides2 slides3"

# rosbag_name_list="room1 room2 room3 room4 room5 room6 corridor1 corridor2 corridor3 corridor4 corridor5 magistrale1 magistrale2 magistrale3 magistrale4 magistrale5 magistrale6 slides1 slides2 slides3 outdoors1 outdoors2 outdoors3 outdoors4 outdoors5 outdoors6 outdoors7 outdoors8"

# rosbag_name_list="magistrale2 magistrale3 magistrale4 magistrale5 magistrale6"
# rosbag_name_list="slides1 slides2 slides3"
# rosbag_name_list="outdoors3 outdoors4 outdoors5 outdoors6 outdoors7 outdoors8"

 # rosbag_name_list="room1 room2 room3 room4 room5 room6 corridor1 corridor2 corridor3 corridor4 corridor5 magistrale1 magistrale2 magistrale3 magistrale4 magistrale5 magistrale6 slides1 slides2 slides3"
 # rosbag_name_list="room1 room2 room3 room4 room5 room6 corridor1 corridor2 corridor3 corridor4 corridor5 magistrale1 magistrale2 magistrale3 magistrale4 magistrale5 magistrale6 slides1 slides2 slides3"

# outdoors1 outdoors2 
rosbag_name_list="outdoors3 outdoors4 outdoors5 outdoors6 outdoors7 outdoors8"

times=1
cur_dir=`pwd`

# rosbag_dir="/media/davidz/Seagate Backup Plus Drive/dataset/tum_vio"
# roslaunch_file="run_together_no_view.launch"
rosbag_dir="/home/hzhang8/work/data/tum_vio"
roslaunch_file="test.launch"
result_dir="$cur_dir/../../result"
rosbag_file=""
exec_dir="$cur_dir"

do_it(){
    i=$1
    cd $exec_dir
    echo "roslaunch $roslaunch_file"
    roslaunch $roslaunch_file & >/dev/null 2>&1
   
    # Save progress() PID
    # You need to use the PID to kill the function
    ROS_PID=$!
    # wait for roslaunch start 
    sleep 5
   
    echo "rosbag play $rosbag_file"
    # rosbag play $rosbag_file -u 10 --r=0.85 #>/dev/null 2>&1
    rosbag play "$rosbag_file" --r=0.7 #>/dev/null 2>&1
    echo "finish rosbag play!"

    # Kill progresse
    echo "kill pid $ROS_PID"
    kill $ROS_PID >/dev/null 2>&1

    sleep 1

    ### process the result 
    cd $result_dir
    echo "handle $result_dir"
    if [ ! -d "tum_vio_result/$rosbag_name/vins-mono_ext" ]; then
	mkdir -p "tum_vio_result/$rosbag_name/vins-mono_ext"
    fi
    
    # cp "../vins_result_no_loop.csv" "tum_vio_result/$rosbag_name/vins-mono_ext/result_$i.log"
    # cp "/home/davidz/work/software/vins_result_no_loop.csv" "tum_vio_result/tmp/$rosbag_name/vins-mono_ext/result_$i.log"
    cp "vins_result_no_loop.csv" "tum_vio_result/$rosbag_name/vins-mono_ext/result_$i.log"

    echo -ne '\n'
}


# for name in "${rosbag_name_list[@]}"
for n in $rosbag_name_list
do
    rosbag_name="${n}_512_16"
    rosbag_file="$rosbag_dir/dataset-$rosbag_name.bag"

    i=1
    while [ $i -le $times ]; do
	echo "vins-mono_ext $i"
	do_it $i
	i=$((i+1))
	sleep 2
    done
done

echo "finish the job, return to $cur_dir"
cd $cur_dir
exit 0
