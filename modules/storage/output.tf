output "web_s3_01_arn" {
    value = "${aws_s3_bucket.pub-s3-01.arn}"
}

output "web_s3_01_id" {
    value = "${aws_s3_bucket.pub-s3-01.id}"
}

output "rawdata_s3_02_arn" {
    value = "${aws_s3_bucket.pub-s3-02.arn}"
}

output "rawdata_s3_02_id" {
    value = "${aws_s3_bucket.pub-s3-02.id}"
}

output "config_s3_01_arn" {
    value = "${aws_s3_bucket.prv-s3-01.arn}"
}

output "config_s3_01_id" {
    value = "${aws_s3_bucket.prv-s3-01.id}"
}

output "data_s3_02_arn" {
    value = "${aws_s3_bucket.prv-s3-02.arn}"
}

output "data_s3_02_id" {
    value = "${aws_s3_bucket.prv-s3-02.id}"
}