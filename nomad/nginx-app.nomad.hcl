job "nginx-app" {
  datacenters = ["dc1"]
  type        = "service"

  update {
    max_parallel      = 1
    min_healthy_time  = "10s"
    healthy_deadline  = "5m"
    progress_deadline = "10m"
    auto_revert       = true
    auto_promote      = true
    health_check      = "checks"
  }

  group "nginx" {
    count = 1

    restart {
      attempts = 3
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }

    network {
      mode = "bridge"

      port "http" {
        to = 8080
      }
    }

    service {
      name = "nginx-app"
      port = "http"

      check {
        name     = "nginx-health"
        type     = "http"
        path     = "/healthz"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "nginx" {
      driver = "docker"

      config {
        image = "ghcr.io/gloria-okekporo/devops-intern-final:${var.image_tag}"
        ports = ["http"]
      }

      resources {
        cpu    = 100
        memory = 64
      }
    }
  }

  variable "image_tag" {
    type    = string
    default = "latest"
  }
}