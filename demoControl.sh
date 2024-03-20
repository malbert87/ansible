#!/bin/bash -x

service=$1
value=$2

case $value in
	"enable") value="1.0";;
	"disable") value="0.0";;
	*) value="0.0";;
esac

case $service in
	"cartServiceFailure") rawData=$(echo '_method=put&_csrf_token=fQwdFVs7OzBnJwpwJi8cawxffB8OMyEk9hvDbsCIVso6CfS-A3OjXvHa&feature_flag%5Bname%5D=cartServiceFailure&feature_flag%5Bdescription%5D=Fail+cart+service+requests&feature_flag%5Benabled%5D='$value);;
	"adServiceFailure") rawData=$(echo '_method=put&_csrf_token=FAgZDkgdNw10GVQyMzkVNS8rfzAQCCUyPlr_qUOtEM1tVpZsbGLEFMLw&feature_flag%5Bname%5D=adServiceFailure&feature_flag%5Bdescription%5D=Fail+ad+service+requests&feature_flag%5Benabled%5D='$value);;
	"recommendationCache") rawData=$(echo '_method=put&_csrf_token=ElADElExSz9CJiggKHg3AyldWRACCzAXV4hChy3FsrMfM1xEd1jeTNYR&feature_flag%5Bname%5D=recommendationCache&feature_flag%5Bdescription%5D=Cache+recommendations&feature_flag%5Benabled%5D='$value);;
	"recommendationCache") rawData=$(echo '_method=put&_csrf_token=FQ4dC396MT9CHxJ0SA53GSQnBzIaNzkmQjvZF2IFsKw2-G8_iK4GLrPc&feature_flag%5Bname%5D=productCatalogFailure&feature_flag%5Bdescription%5D=Fail+product+catalog+service+on+a+specific+product&feature_flag%5Benabled%5D='$value);;
esac


curl "http://a58e7d784a9b64d4296758b12e526415-1640315897.us-east-2.elb.amazonaws.com:8080/feature/featureflags/${service}" \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'Accept-Language: en-US,en;q=0.9,pt-BR;q=0.8,pt;q=0.7,es-US;q=0.6,es;q=0.5,ja;q=0.4,nl;q=0.3' \
  -H 'Cache-Control: max-age=0' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Cookie: _featureflagservice_key=SFMyNTY.g3QAAAABbQAAAAtfY3NyZl90b2tlbm0AAAAYRGRrUTlIeHkxVGVGZUlPRk1sM3VWRWlF.fKhqYYfJU4HsnXUsKcqEORpm4V_sWpfiBBbaxqRP5f8' \
  -H 'DNT: 1' \
  -H 'Origin: http://a58e7d784a9b64d4296758b12e526415-1640315897.us-east-2.elb.amazonaws.com:8080' \
  -H 'Referer: http://a58e7d784a9b64d4296758b12e526415-1640315897.us-east-2.elb.amazonaws.com:8080/feature/featureflags/cartServiceFailure/edit' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36' \
  --data-raw "$rawData" \
  --insecure
