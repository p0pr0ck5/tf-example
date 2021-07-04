resource "stress_cpu" "why-are-you-doing-this" {
  duration = 300 # How long to keep the load up in Seconds
}

resource "stress_memory" "sad-ram-dot-emoji" {
  duration = 300 # How long to hold the memory
  size = 256 # Memory to allocate in MB
}
