killall polybar

export DISPLAY=:0

count=0

out=$(polybar --list-monitors | cut -d":" -f1)

for m in $out; do
	count=$(($count+1))
done


if [ $count == 3 ]; then
	polybar --reload left &
	polybar --reload middle &
	polybar --reload right &
elif [ $count == 2 ]; then
	polybar --reload left &
	polybar --reload right-alt &
else
	polybar --reload mobile &
fi

killall polybar

polybar --reload --config=/home/loc/.config/polybar/config.ini mobile &
