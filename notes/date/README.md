# Notes - `date`

Notes on `date` Linux/Unix command:

  1. [Get Older/Future Dates](#1-get-olderfuture-dates)
  2. [Epoch to Human-Readable](#2-epoch-to-human-readable)


## 1. Get Older/Future Dates

~~~
$ date --date="2 days ago"
$ date --date="-1 day"
$ date --date='last Friday'
~~~

## 2. Epoch to Human-Readable

~~~
$ date -d @1234567890 +'%Y-%m-%d %H:%M:%S'
~~~

## 3. Refereces

  - [Get Yesterdays or Tomorrows Day with Date Command](https://www.cyberciti.biz/tips/linux-unix-get-yesterdays-tomorrows-date.html)
