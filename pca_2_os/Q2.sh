#Write a script to monitor a specific process by its name. If the process is running, display
#its process ID (PID) and memory usage. If it isn’t, display a message saying it’s not
#active. Pass the process name as an argument.
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <process_name>"
  exit 1
fi
process_name=$1
pids=$(pgrep -x "$process_name")
if [ -z "$pids" ]; then
  echo "Process '$process_name' is not active."
else
  echo "Process '$process_name' is running."
  for pid in $pids; do
    echo "Process details for PID $pid:"
    ps -p "$pid" -o pid,ppid,cmd,%mem,%cpu,rss,vsz,etime
    echo
  done
fi


