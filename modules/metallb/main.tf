resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = "metallb"
  version          = "0.14.4"
  create_namespace = true
  timeout = 300

}

resource "null_resource" "wait_for_metallb" {
  triggers = {
    key = uuid()
  }

  provisioner "local-exec" {
    command = <<EOF
      printf "\nWaiting for the metallb controller...\n"
      kubectl wait --namespace ${helm_release.metallb.namespace} \
        --for=condition=ready pod \
        --selector=app.kubernetes.io/component=speaker \
        --timeout=90s
    EOF
  }

  depends_on = [helm_release.metallb]
}
