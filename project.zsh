function start_project(){
		SESSION_NAME=$1
		PROJECT_ROOT="$HOME/Projects/$SESSION_NAME/"

		env TMUX='' tmux new-session -d -c $PROJECT_ROOT -s $SESSION_NAME

		window_1='control'
		tmux rename-window -t $SESSION_NAME:0 $window_1
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_1
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_1
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_1
		tmux select-layout -t $SESSION_NAME:$window_1 '29eb,170x48,0,0[170x24,0,0,70,170x23,0,25{56x23,0,25,74,56x23,57,25,75,56x23,114,25,76}]'

		window_2='development'
		echo "Window: $window_2"
		tmux new-window -a -c $PROJECT_ROOT -t $SESSION_NAME -n $window_2
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_2
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_2
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_2
		tmux select-layout -t $SESSION_NAME:$window_2 'even-horizontal'
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_2
		tmux select-layout -t $SESSION_NAME:$window_2 'ed6c,170x48,0,0{85x48,0,0[85x24,0,0,96,85x23,0,25,100],84x48,86,0[84x24,86,0,97,84x11,86,25,98,84x11,86,37,99]}'

		window_3='editor'
		echo "Window: $window_3"
		tmux new-window -a -t $SESSION_NAME -n $window_3
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_3
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_3
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_3
		tmux select-layout -t $SESSION_NAME:$window_3 'even-horizontal'
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_3
		tmux select-layout -t $SESSION_NAME:$window_3 '7548,170x48,0,0{113x48,0,0,131,56x48,114,0[56x11,114,0,132,56x11,114,12,133,56x11,114,24,134,56x12,114,36,135]}'
		tmux send-keys -l -t $SESSION_NAME:$window_3'.0' 'emacsclient -s projects -t'
		tmux send-keys -t $SESSION_NAME:$window_3'.0' 'Enter'

		window_4='logs'
		echo "Window: $window_4"
		tmux new-window -a -t $SESSION_NAME -n $window_4
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_4
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_4
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_4
		tmux select-layout -t $SESSION_NAME:$window_4 'even-horizontal'
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_4
		tmux split-window -v -c $PROJECT_ROOT -t $SESSION_NAME:$window_4
		tmux select-layout -t $SESSION_NAME:$window_4 '56fc,169x47,0,0[170x15,0,0{84x15,0,0,89,85x15,85,0,92},170x15,0,16{84x15,0,16,93,85x15,85,16,90},170x16,0,32{84x16,0,32,94,85x16,85,32,95}]'

		tmux select-window -t $SESSION_NAME:$window_1
}
