LogFormat "%h %l %u %t %{usec_frac}t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\"" micro
CustomLog ${APACHE_LOG_DIR}/access.log micro
ErrorLog  ${APACHE_LOG_DIR}/error.log

