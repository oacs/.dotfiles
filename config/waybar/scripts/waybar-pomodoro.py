#!/usr/bin/env python
import time
import json
import sys
import os
import threading
import queue
import fcntl
import errno

print("{'text': 'init'}")

class Pomodoro:
    def __init__(self):
        self.start_time = None
        self.end_time = None
        self.total_time = 1500  # 25 minutes by default
        self.is_running = False
        self.elapsed_time = 0  # Elapsed time in seconds
        self.lock = threading.Lock()

    def start(self):
        if not self.is_running:
            if not self.start_time:  # Start a new pomodoro
                self.start_time = time.time()
                self.end_time = self.start_time + self.total_time
            else:  # Resume a paused pomodoro
                self.end_time = time.time() + (self.end_time - self.start_time)
                self.start_time = time.time()
            self.is_running = True

    def pause(self):
        if self.is_running:
            self.elapsed_time += time.time() - self.start_time
            self.is_running = False

    def current_pomodoro(self):
        if not self.start_time:
            return json.dumps({"text": ""})
        elif not self.is_running:
            elapsed_time = self.elapsed_time
            remaining_time = self.total_time - elapsed_time
        else:
            elapsed_time = self.elapsed_time + time.time() - self.start_time
            remaining_time = self.total_time - elapsed_time
        
        elapsed_minutes, elapsed_seconds = divmod(elapsed_time, 60)
        remaining_minutes, remaining_seconds = divmod(remaining_time, 60)
        
        elapsed_time_str = f"{int(elapsed_minutes):02d}:{int(elapsed_seconds):02d}"
        remaining_time_str = f"{int(remaining_minutes):02d}:{int(remaining_seconds):02d}"
        
        return json.dumps({"elapsed_time": elapsed_time_str, "text": remaining_time_str})

class PomodoroTimer(threading.Thread):
    def __init__(self, pomodoro, command_queue):
        super().__init__()
        self.pomodoro = pomodoro
        self.command_queue = command_queue
        self.stop_event = threading.Event()

    def run(self):
        while not self.stop_event.is_set():
            try:
                command = self.command_queue.get(timeout=1)
                if command == "start":
                    self.pomodoro.start()
                elif command == "pause":
                    self.pomodoro.pause()
                elif command == "toggle":
                    if self.pomodoro.is_running:
                        self.pomodoro.pause()
                    else:
                        self.pomodoro.start()
                elif command == "stop":
                    self.stop_event.set()
            except queue.Empty:
                pass

            current_state = self.pomodoro.current_pomodoro()
            if current_state:
                print(current_state)
            time.sleep(1)

def with_file_lock(file, operation):
    fcntl.flock(file, fcntl.LOCK_EX)
    try:
        operation(file)
    finally:
        fcntl.flock(file, fcntl.LOCK_UN)

FIFO_PATH = "pomodoro_fifo"

pomodoro = Pomodoro()
command_queue = queue.Queue()

# Load pomodoro state
if os.path.exists('pomodoro_state.json'):
    try:
        with open('pomodoro_state.json', 'r') as f:
            def load_state(file):
                state = json.load(file)
                pomodoro.start_time = state['start_time']
                pomodoro.end_time = state['end_time']
                pomodoro.total_time = state['total_time']
                pomodoro.is_running = state['is_running']
                pomodoro.elapsed_time = state['elapsed_time']
            with_file_lock(f, load_state)
    except json.JSONDecodeError:
        pass

if not os.path.exists(FIFO_PATH):
    os.mkfifo(FIFO_PATH)

timer_thread = PomodoroTimer(pomodoro, command_queue)
timer_thread.start()

try:
    with open(FIFO_PATH, "r") as fifo:
        while True:
            command = fifo.readline().strip().lower()
            if command in {"start", "pause", "toggle", "stop"}:
                command_queue.put(command)
                if command == "stop":
                    break
            elif command:
                print("Invalid command")
except KeyboardInterrupt:
    command_queue.put("stop")

timer_thread.join()

# Save pomodoro state
with open('pomodoro_state.json', 'w') as f:
    def save_state(file):
        state = {
            'start_time': pomodoro.start_time,
            'end_time': pomodoro.end_time,
            'total_time': pomodoro.total_time,
            'is_running': pomodoro.is_running,
            'elapsed_time': pomodoro.elapsed_time
        }
        json.dump(state, file)
    with_file_lock(f, save_state)
