# Notes - Oracle DB

Notes on Oracle databases:

  1. [Switch/Login to a Pluggable Database](#1-switchlogin-to-a-pluggable-database)
  2. [Reset Expired Password](#2-reset-expired-password)
  3. [Unset Expiration Options (Profile)](#3-unset-expiration-options-profile)
  4. [References Expiration Options (Profile)](#4-references)




## 1. Switch/Login to a Pluggable Database


## 2. Reset Expired Password

Reset password and  unlock user...

~~~
SQL> ALTER USER yourRandomUser IDENTIFIED BY 'yourRandomPa5sw0rd';
SQL> ALTER USER yourRandomUser ACCOUNT UNLOCK;
~~~

The interesting point here is when you want to unset expiration **without** changing the password.
E.g. For an application/service user that might be complicated to change the password on the
application side.

The solution here is to "reset" the password, using the already stored hash. You will be asked for
the username and you only need to type in the printed statement:

~~~
SQL> select 'alter user "'||d.username||'" identified by values '''||u.password||''';' c from dba_users d, sys.user$ u where d.username = upper('&&username') and u.user# = d.user_id;
Enter value for username: yourRandomUser
...
----------------------------------------------------------------------------------------------------
alter user "yourRandomUser" identified by values '*********************';

SQL> alter user "yourRandomUser" identified by values '*********************';
User altered.
~~~


## 3. Unset Expiration Options (Profile)

The expiration option are per profile, as well as all password-related options. The way to set/reset
these options is as per below.

Find out the user's profile (if not {{DEFAULT}})...
~~~
SQL> select USERNAME,PROFILE,ACCOUNT_STATUS,EXPIRY_DATE from DBA_USERS where USERNAME='yourRandomUser';
~~~

Loosen up the expiration policy for {{yourRandomProfile}} or {{DEFAULT}} profile...
~~~
SQL> alter profile DEFAULT limit PASSWORD_REUSE_TIME unlimited;
SQL> alter profile DEFAULT limit PASSWORD_LIFE_TIME unlimited;
~~~

Loosen up all limitations...
~~~
SQL> ALTER PROFILE yourRandomProfile LIMIT
  COMPOSITE_LIMIT          UNLIMITED
  PASSWORD_LIFE_TIME       UNLIMITED
  PASSWORD_REUSE_TIME      UNLIMITED
  PASSWORD_REUSE_MAX       UNLIMITED
  PASSWORD_VERIFY_FUNCTION NULL
  PASSWORD_LOCK_TIME       UNLIMITED
  PASSWORD_GRACE_TIME      UNLIMITED
  FAILED_LOGIN_ATTEMPTS    UNLIMITED;
~~~


## 4. References

  - [Oracle Profile &amp; Password Management](https://www.orafaq.com/wiki/Profiles_and_password_management)
  - [Turn off Oracle Password Expiration](https://stackoverflow.com/questions/1095871/how-do-i-turn-off-oracle-password-expiration)
  - [Save Oracle User Password](http://www.dba-oracle.com/t_save_reset_oracle_user_password.htm)
