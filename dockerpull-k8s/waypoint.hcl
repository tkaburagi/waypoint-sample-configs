project = "k8s-dockerpull-java"

app "k8s-dockerpull-java" {
  labels = {
    "service" = "k8s-dockerpull-java",
    "env" = "dev"
  }

  build {
    use "docker-pull" {
      image = "gcr.io/se-kabu/example-java"
      tag = "2"
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
