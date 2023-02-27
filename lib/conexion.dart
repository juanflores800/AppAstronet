//import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''
{
  "type": "service_account",
  "project_id": "tutorial-378600",
  "private_key_id": "1725e5765779e5e92fab78b1e9e9398901de9526",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC1NbJUWqH2uZmE\nH4G3EyT+3LsWDkZ12mNrH6laujni6HAu8T9cTQvkecOhZfK/LyRW93/VK01/vc/J\n49SwsP+HyCvJvSDCw5mrwPe7o4Wxd0VbEBFB3GMHh+x8pUPnZJnqoLaz9i3agW9l\nHZcvw+L5NRrmA5zZx3AEwDBuFWVgP2eKoAN5orFAT2nZ/piXij/76idDXwdCf8an\n2YwrlCf/fu7RTAj6bn4iMwbO9uEtsrfJsVXSwxmRjxwUhMQ0CE+g16wmEKgz7yaf\n3tLm2jkW8ydaYaoI2XFuZQF/zbdASIa7TS+xJrKzrk5JUvVntXH5k7QROcKnl/5G\niDhxZLtBAgMBAAECggEAMTj2yeccm7JquvL7/0jaAcjfoOwbw6Og4dZl4Fk5pCNT\nZczuUxoyostYkpzoxXn+uwjb1oG+uXZL3SFgAubxYmbDTjdrkLwlH/x4zqVqiXxG\ngKfqqCM/WypW2LzjpxUyogMp3dR/PB1wrtzM1pK1MtB0EArnLlj4WrIB9cUmFnBt\noh/GdXgnVfsUJZ8DkdQ+WFv/adztRCwoB7cJmmI2qSPgeWEpHFs7vBCB9EDhYLcL\noe42b2dF0YKp5SCjXAsFjc2XRj6PCmmBhSbpXdpfLN6aS0VmiZ6Q/b+v3BhV9ic9\nwP4U0Z/AOgtxv9ZrBAhgoEhcfZxmAHNGY+/3eu6vKQKBgQDYwnEw+dhYazpZbwUj\nlBVs03GNXIVHMebhMKEfbWCOQ7x9R0vV52qMFcliya57VPI2s4oJw4I+pRGmERtt\nkVKDhsjgqYWpxAWsGpaUkDc3JcPAQ27wJowOR+SMJNVEBahp/ki7/V4BN0nhuK4n\n9JXQVniYPvWDsCOgpIfIMk0tHwKBgQDWA7nuEBp2ilO0Doyb6i2jqlI8zhUnYvn9\nbOFCs/chWZdWK2IJaCR5ARsuUgiN29ogCJSj9UlZziP3RHX1GQ4vX0wgTfPscpuR\nB+hY9b7N9BfcD8qFcDiVnv/18rWyCRxcPSYw7IVWbp7ed9l65lHAhEny7IMuIRxR\nGrwGXW6rnwKBgQDISCmkckantDRO7JkX/b0qN9lFH8b6OK63RmKqEjtUWFwyeY0l\n0VUOqRbSU74HsT64sn4KdX7D+WvsQQRR4iQW6ZR0mc6qRThkhJC8JuEN8LQF04kP\nFt70VxNjNqlj18J8ZXu5T+vrPbXjfexVeNZwkWWObyYVjsvso/neTjQnSwKBgBCB\n4xKAvXnNO52UzbWs/24zUfqMrscF9GBeyJU7imFRJsInwH0XQlDvC+irvSsr/Qwh\nfU2UOt8pbk7BQhPwpc5znEyVlq3zPRqXsI1EDz6ViE2aDjXyrPqlc/rFiMw9talL\nsilt5O8Aw1JHjkfTghTGX2nUYl3pgeSjmkMna8TjAoGBAJg9NXuDvXgW5ShjqQmL\n52Q1NTr2kOkjv9ST2nYr7qN5MF7xEgXaBFBmcHuZobPNKzIPE2yf32CzUWIgIGtM\nSMtNqtNHNf7rSM+e4cU9fup2MW4o2EB/gCQ5ttNhKKEkOYpuu/0YqunIwaOD+wh7\n2uHoplvhaovwQgxjb6ekglun\n-----END PRIVATE KEY-----\n",
  "client_email": "tutorial@tutorial-378600.iam.gserviceaccount.com",
  "client_id": "109419016262169719407",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/tutorial%40tutorial-378600.iam.gserviceaccount.com"
}
''';

const _spreadsheetId = '16gG3usp-xT7nD4GZg51_zNMHQGwWjgZwIqqlJJHkoAU';

// ignore: non_constant_identifier_names
Future<List> Buscar(String querry) async {
  var s = ['n', 'n'];
  final gsheets = GSheets(_credentials);
  // fetch spreadsheet by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId);
  // get worksheet by its title
  var sheet = ss.worksheetByTitle('example');
  // create worksheet if it does not exist yet
  sheet ??= await ss.addWorksheet('example');

  // mandamos valor a buscar y nos devulve la columna
  var i = await sheet.values.rowIndexOf(querry);
  // recuperamos un array con los valores de la columna
  //print(i);
  if (i == -1) {
    return s;
  } else {
    var s = await sheet.values.row(i);
    //print(s);
    return s;
  }
}
