terraform {
  backend "gcs" {
    bucket  = "storage-bessonov-test"
    prefix  = "stage"
  }
}