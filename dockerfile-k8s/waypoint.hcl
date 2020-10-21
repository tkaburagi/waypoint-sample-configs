project = "k8s-dockerfile-java"

app "k8s-dockerfile-java" {
  labels = {
    "service" = "k8s-dockerfile-java",
    "env" = "dev"
  }

  build {
    use "docker" {
      disable_entrypoint = true
      buildkit = false
    }
    registry {
      use "docker" {
        image = "gcr.io/se-kabu/example-java"
        tag = "2"
        local = false
      }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"
      service_port = 8080
    }
  }

  release {
    use "kubernetes" {
      port = 8080
      load_balancer = true
    }
  }
}
