project = "ecs-nodejs"

app "ecs-nodejs-2" {
  labels = {
    "service" = "ecs-nodejs",
    "env" = "dev"
  }

  build {
    use "pack" {
      builder = "gcr.io/paketo-buildpacks/builder:base"
    }
    registry {
      use "aws-ecr" {
        region = "ap-northeast-1"
        repository = "waypoint-example"
        tag = "latest"
      }
    }
  }

  deploy {
    use "aws-ecs" {
      region = "ap-northeast-1"
      memory = "1024"
    }
  }
}
