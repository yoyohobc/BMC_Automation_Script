val=$1
if [ -z "$val" ]; then
    val=150
fi
PWM=$(find / type f -name "*pwm*")

for fan in ${PWM}
do
    if [[ ${fan:(-4)} == "pwm"* ]]; then
        echo ${val} > ${fan}
    fi
done