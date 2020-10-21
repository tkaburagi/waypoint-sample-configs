project = "k8s-dockerfile-java"

app "k8s-dockerfil-java" {
  labels = {
    "service" = "k8s-dockerfile-java",
    "env" = "dev"
  }

  build {
    use "docker" {
      disable_entrypoint = false
      buildkit = false
    }
    registry {
      use "docker" {
        image = "gcr.io/se-kabu/example-java"
        tag = "1"
        local = false
      }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"
    }
  }

  release {
    use "kubernetes" {
    }
  }
}
