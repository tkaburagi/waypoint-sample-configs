project = "dockerfile-exec-k8s"

app "dockerfile-exec-k8s" {
  labels = {
    "service" = "dockerfile-exec-k8s",
    "env" = "dev"
  }

  build {
    use "docker" {
      disable_entrypoint = true
      buildkit = false
    }
    registry {
      use "docker" {
        image = "gcr.io/se-kabu/nginx"
        tag = "latest"
        local = false
      }
    }
  }

  deploy {
    use "exec" {
      command = ["kubectl", "apply", "-f", "two-container-pod.yaml", "--validate=false"]
    }
  }
}