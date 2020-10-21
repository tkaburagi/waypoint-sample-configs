project = "k8s-dockerpull-java"

app "k8s-dockerpull-java" {
  labels = {
    "service" = "k8s-dockerpull-java",
    "env" = "dev"
  }

  build {
    use "docker-pull" {
      image = "gcr.io/se-kabu/example-nodejs"
      tag = "1"
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
