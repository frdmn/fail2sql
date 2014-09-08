fail2sql
========

![](http://up.frd.mn/mz3ef.png)

(originally by Jordan Tomkinson <jordan@moodle.com>, checkout the [SourceForge project page](http://fail2sql.sourceforge.net/))

fail2sql is called by Fail2Ban and logs information to a MySQL database including geographical location.
This information can then be used in reports, graphs or by third party programs to take further action such as permanent blocking, reporting to ISP and so on

#### Logged informations

* Name (from fail2ban)
* Protocol
* Port
* IP
* Longitude
* Latitude
* Country Code
* Geo Data (city, country)
* Timestamp

## Usage

```
fail2sql [-h|-l|-c|-u]
	-h: The help page
	-l: List entries in the database (max 50 showed)
	-c: Clear the database and start fresh
	-u: Update GeoIP database (downloads from maxmind)
```

## Installation

1. Clone the GitHub repo:  
`git clone https://github.com/frdmn/fail2sql /usr/local/fail2sql`
1. Change directory:  
`cd /usr/local/fail2sql`
1. Create a SQL database and user for fail2sql:  
`mysql -u root -p`
```
CREATE DATABASE fail2ban;
CREATE USER 'fail2ban'@'localhost' IDENTIFIED BY 'ceuWr4nd0m5Z6qQG';
GRANT ALL ON fail2ban.* TO 'fail2ban'@'localhost';
```
1. Import MySQL structure to create neccessary tables:  
`mysql -u fail2ban -p fail2ban < opt/fail2sql.sql`
1. Rename and adjust settings file:  
`mv settings-rename.php settings.php`  
`vi settings.php`  
1. Initial update of the geo IP database:  
`./fail2sql -u`
1. Adjust Fail2Ban action to call fail2sql:
`vi /etc/fail2ban/action.d/sendmail-whois-lines.conf`  
```
actionban = printf %%b "Subject: [Fail2Ban][<host>] <name>: banned <ip>
            Date: `LC_TIME=C date -u +"%%a, %%d %%h %%Y %%T +0000"`
            From: <sendername> <<sender>>
            To: <dest>\n
            Hi,\n
            The IP <ip> has just been banned by Fail2Ban after
            <failures> attempts against <name>.\n\n
            Here are more information about <ip>:\n
            `/usr/bin/whois <ip>`\n\n
            Lines containing IP:<ip> in <logpath>\n
            `grep '\<<ip>\>' <logpath>`\n\n
            Regards,\n
            Fail2Ban" | /usr/sbin/sendmail -f <sender> <dest>
            /usr/local/fail2sql/fail2sql `hostname -f` "tcp" <name> <ip>
```

## Version

1.0.0

## License

[GPLv2](LICENSE)
