#Create a script that monitors CPU and memory usage every 5 seconds and logs the
#information to a file. If the CPU or memory usage exceeds a certain threshold, send a
#warning message to the console.

CPU_THRESHOLD=80  
MEM_THRESHOLD=10  


LOG_FILE="system_usage.log"

get_usage() {
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
  MEM_USAGE=$(free | grep Mem | awk '{printf "%.2f", $3/$2 * 100}')
}

log_and_check() {
  TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
  get_usage

  echo "$TIMESTAMP - CPU: $CPU_USAGE%, Memory: $MEM_USAGE%" >> $LOG_FILE

  if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "Warning: CPU usage is above $CPU_THRESHOLD% (Current: $CPU_USAGE%)"
  fi

  if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
    echo "Warning: Memory usage is above $MEM_THRESHOLD% (Current: $MEM_USAGE%)"
  fi
}

echo "Monitoring CPU and Memory usage... (Logging to $LOG_FILE)"
while true; do
  log_and_check
  sleep 5
done



