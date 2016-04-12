#!/usr/bin/bash
function die {
	echo -n -e '<<<----'
	echo -n $1
	echo -e '---->>>'
}

function update_k12_b {
    echo "开始更新"
    cd /vagrant/k12_v3
    git pull
    gulp clean-web
    gulp clean-app
    echo "更新完成"
}
function update_k12_c {
    echo "开始更新"
    cd /vagrant/k12_toc_v3
    git pull
    gulp clean-web
    gulp clean-app
    echo "更新完成"
}
function update_k12_p {
    echo "开始更新"
    cd /vagrant/k12v3_passport/
    git pull
    echo "更新完成"
}


function update_k12 {
    if [[ $1 == "-b" ]]; then
        update_k12_b
    elif [[ $1 == "-c" ]]; then
        update_k12_c
    elif [[ $1 == "-bc" ]]; then
       update_k12_b
       update_k12_c
    elif [[ $1 == "-p" ]]; then
       update_k12_p
    elif [[ $1 == "-all" ]]; then
       update_k12_b
       update_k12_c
       update_k12_p
    else
       die "Invalid argument: $1"
    fi
}

case "$1" in
k12)
	update_k12 $2
	;;
*)
echo 'Usage:' `basename $0` '[option] [argument]'
echo 'Available options (in recomended order):'
echo '  - k12  '
echo '       -all  (git pull for k12b,k12c,k12p)'
echo '       -b    (git pull for k12b)'
echo '       -c    (git pull for k12c)'
echo '       -p    (git pull for passport)'
;;
esac
