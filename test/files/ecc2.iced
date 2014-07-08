
{KeyManager} = require '../../lib/main'

exports.import_ecc_key_with_private_gen_by_google_e2e_1 = (T, cb) ->

  key = """-----BEGIN PGP PRIVATE KEY BLOCK-----
  Charset: UTF-8
  Version: End-To-End v0.3.1338

  xf8AAAB3BFOsKbATCCqGSM49AwEHAgMEhEKmGdZix3AbyoAVe6Bd4WZE8jGVUbKh
  NCaDyKaE7rKk5JZa2hIyaJN8wEOIJ3hWgPBTK13n+zvrllSNRz9+7gAA/iCIKxxK
  M3Q81TyXQASN345AWSmjb/evQfwFBreq1M57D0DN/wAAABI8dGhlbWF4QGdtYWls
  LmNvbT7C/wAAAGYEEBMIABj/AAAABYJTrCmw/wAAAAmQh6GhxI25BWcAAEphAQCY
  dab0CXAU1JCEUDegFih6n1LJjlQ8rr9jkdkplfZKyAD/Z/204vz6ICHYB8rhHOC6
  127D8KHdLYaR8KKNPEDw6m/H/wAAAHsEU6wpsBIIKoZIzj0DAQcCAwRiCoBfuydu
  cp3FChW9Q4Yz6cXU2okTyGv2hHsnQ2P5tilLSBp2cv4TnV4LIawNsP+gsesoXSln
  hFb+sAdaTvwxAwEIBwAA/AvHI+wsE9cFyxe6tHePCa+/KCrRia6Jz9VYMkTJKxcD
  DyjC/wAAAGYEGBMIABj/AAAABYJTrCmw/wAAAAmQh6GhxI25BWcAAASlAP985Usk
  lzOHK4VuqatRW35xBICiymeQX+aDXbU/6OL1cwD7Bj+TmwRDQe9b3yAV8ktaZM/L
  3Uc+HTz2Cp9wtwSPXXfG/wAAAFIEU6wpsBMIKoZIzj0DAQcCAwSEQqYZ1mLHcBvK
  gBV7oF3hZkTyMZVRsqE0JoPIpoTusqTkllraEjJok3zAQ4gneFaA8FMrXef7O+uW
  VI1HP37uzf8AAAASPHRoZW1heEBnbWFpbC5jb20+wv8AAABmBBATCAAY/wAAAAWC
  U6wpsP8AAAAJkIehocSNuQVnAABKYQEAmHWm9AlwFNSQhFA3oBYoep9SyY5UPK6/
  Y5HZKZX2SsgA/2f9tOL8+iAh2AfK4Rzgutduw/Ch3S2GkfCijTxA8Opvzv8AAABW
  BFOsKbASCCqGSM49AwEHAgMEYgqAX7snbnKdxQoVvUOGM+nF1NqJE8hr9oR7J0Nj
  +bYpS0gadnL+E51eCyGsDbD/oLHrKF0pZ4RW/rAHWk78MQMBCAfC/wAAAGYEGBMI
  ABj/AAAABYJTrCmw/wAAAAmQh6GhxI25BWcAAASlAPsFvd0AeDmF2wBJd4l1g0oV
  TfplxTTTYO6DJP5McmTtKwD+P7WgGuy0IssdwD7bU//zlOvl9nyztxojitGtDtT2
  CNU=
  =TRLE
  -----END PGP PRIVATE KEY BLOCK-----"""

  await KeyManager.import_from_armored_pgp { raw : key }, defer err, km, warnings
  T.no_error err
  T.assert km?, "a key manager returned"
  T.assert (warnings.warnings().length is 0), "didn't get any warnings"
  cb()
