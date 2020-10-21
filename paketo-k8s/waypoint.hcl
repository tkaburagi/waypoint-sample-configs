project = "k8s-nodejs"

app "k8s-nodejs" {
  labels = {
      "service" = "k8s-nodejs",
      "env" = "dev"
  }

  build {
    use "pack" {
      builder = "gcr.io/paketo-buildpacks/builder:base"
    }
    registry {
        use "docker" {
          image = "gcr.io/se-kabu/example-nodejs"
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
      load_balancer = true
    }
  }
}
